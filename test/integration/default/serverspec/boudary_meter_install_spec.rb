require 'serverspec'

set :backend, :exec

describe package('boundary-meter') do
  it { should be_installed }
end

describe service('boundary-meter') do
  it { should be_running }
end
