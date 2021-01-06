require 'serverspec'
require 'docker'
require 'docker/compose'
require 'rspec/wait'

set :backend, :docker
set :docker_container, 'nginx'

RSpec.configure do |config|
  config.wait_timeout = 45 # seconds

  compose = Dir.chdir(File.join(Dir.pwd, 'fixture')) do
    Docker::Compose.new
  end

  config.before(:all) do
    compose.up(detached: true, build: true)
  end

  config.after(:all) do
    compose.kill
    compose.rm(force: true)
  end
end
