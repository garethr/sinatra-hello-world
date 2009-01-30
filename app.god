THIN_CONFIG = "/www/projects/sinatra-hello-world/config.yml"
RACK_CONFIG = "/www/projects/sinatra-hello-world/config.ru"

config = YAML.load_file(THIN_CONFIG)

num_servers = config["servers"] ||= 1

(0...num_servers).each do |i|
  number = config['socket'] ? i : (config['port'] + i)

  God.watch do |w|
    w.name = "thin-sinatra-hello-world"
  
    w.interval = 30.seconds
  
    w.uid = config["user"]
    w.gid = config["group"]
  
    w.start = "thin -C #{THIN_CONFIG} -R #{RACK_CONFIG} -o #{number} start"
    w.start_grace = 10.seconds
  
    w.stop = "thin -C #{THIN_CONFIG} -R #{RACK_CONFIG} -o #{number} stop"
    w.stop_grace = 10.seconds
  
    w.restart = "thin restart -C #{THIN_CONFIG} -R #{RACK_CONFIG} -o #{number}"

    pid_path = config["pid"]
    ext = File.extname(pid_path)

    w.pid_file = pid_path.gsub(/#{ext}$/, ".#{number}#{ext}")
  
    w.behavior(:clean_pid_file)

    w.start_if do |start|
      start.condition(:process_running) do |c|
        c.interval = 5.seconds
        c.running = false
      end
    end

    w.restart_if do |restart|
      restart.condition(:memory_usage) do |c|
        c.above = 150.megabytes
        c.times = [3,5] # 3 out of 5 intervals
      end

      restart.condition(:cpu_usage) do |c|
        c.above = 50.percent
        c.times = 5
      end
    end

    w.lifecycle do |on|
      on.condition(:flapping) do |c|
        c.to_state = [:start, :restart]
        c.times = 5
        c.within = 5.minutes
        c.transition = :unmonitored
        c.retry_in = 10.minutes
        c.retry_times = 5
        c.retry_within = 2.hours
      end
    end
  
  end  
end