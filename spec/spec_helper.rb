require 'serverspec'
require 'docker'
require 'docker/compose'
require 'rspec/wait'

set :backend, :docker
set :docker_container, 'nginx'

def fixtures
  # Circle has a weird behavior for PWD
  pwd = ENV['CIRCLE_WORKING_DIRECTORY'] || Dir.pwd
  File.join(pwd, 'fixture')
end

RSpec.configure do |config|
  config.wait_timeout = 45 # seconds

  compose = Dir.chdir(fixtures) do
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
