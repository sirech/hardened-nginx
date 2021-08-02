require_relative 'spec_helper'

describe 'Container' do
  describe file('/etc/alpine-release') do
    its(:content) { is_expected.to match(/3.14/) }
  end

  describe 'nginx' do
    describe package('nginx') do
      it { is_expected.to be_installed }
    end

    describe command('nginx -v') do
      its(:stderr) { is_expected.to match(%r{nginx/1.21}) }
    end
  end

  [
    '/usr/bin/curl',
    '/usr/bin/gomplate'
  ].each do |executable|
    describe file(executable) do
      it { is_expected.to be_file }
      it { is_expected.to be_executable }
    end
  end

  describe 'fetches a page' do
    it { wait_for(index).to match(/Hello World/) }
  end

  private

  def index
    # It's a self-signed certificate
    command('curl -k https://localhost').stdout
  end
end
