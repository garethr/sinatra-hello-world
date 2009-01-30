# Sinatra supports the use of Rack middleware which 
# can be useful for modifying responses based on request data

class SampleRackMiddleware
  # this sample middleware actually does nothing
  # and is simply a skeleton for a real piece of middleware
  def initialize app
    @app = app
  end
  def call env
    response = @app.call(env)
    # you would generally make changes to the response object here
    # either by adding additional headers or modifying existing ones
    response
  end
end