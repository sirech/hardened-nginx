require 'serverspec'
require 'docker'
require 'rspec/wait'

set :backend, :docker
set :docker_image, "#{ENV.fetch('IMAGE_NAME')}-test"

RSpec.configure do |config|
  config.wait_timeout = 60 # seconds
end
