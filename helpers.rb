# helpers are methods injected for use inside your views

helpers do
  # this sample helper simply injects the word bar at the end 
  # of text it's called with and returns the resulting string
  def bar(name)
    "#{name}bar"
  end
end