require 'spec_helper'

describe package('nginx') do
  it { should be_installed }
end

describe service('nginx') do
  it { should be_enabled }
  it { should be_running }
end

describe port(80) do
  it { should be_listening }
end

# Test for the hostname in the default site output
describe command('curl -s localhost') do
  its(:stdout) { should match Socket.gethostname }
end
