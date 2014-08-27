require 'serverspec'

include Serverspec::Helper::Exec
include Serverspec::Helper::DetectOS

describe package('boundary-meter') do
  it { should be_installed }
end

describe service('boundary-meter') do
  it { should be_running }
end
