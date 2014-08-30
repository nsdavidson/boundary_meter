require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

describe 'boundary_meter::disable' do
  let(:chef_run) { ChefSpec::Runner.new.converge(described_recipe) }

  it 'should disable the boundary-meter service' do
    expect(chef_run).to disable_service('boundary-meter')
  end

  it 'should stop the boundary-meter service' do
    expect(chef_run).to stop_service('boundary-meter')
  end
end
