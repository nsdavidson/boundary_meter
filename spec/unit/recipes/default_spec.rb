require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

describe 'boundary_meter::default' do
  # Setup chef run with Boundary enabled
  let(:chef_run_enabled) do
    ChefSpec::Runner.new(platform: 'redhat', version: '6.4') do |node|
      node.automatic['boundary']['meter']['enabled'] = true
    end.converge(described_recipe)
  end

  let(:chef_run_disabled) do
    ChefSpec::Runner.new(platform: 'redhat', version: '6.4') do |node|
      node.automatic['boundary']['meter']['enabled'] = false
    end.converge(described_recipe)
  end

  # Stub out provisioning
  before do
    stub_command("./boundary-meter-provision -i dummy_token").and_return(1)
  end

  # Tests for recipe inclusion
  it 'install chef-sugar' do
    expect(chef_run_enabled).to include_recipe('chef-sugar::default')
  end

  it 'should install Boundary if enabled' do
    expect(chef_run_enabled).to include_recipe('boundary_meter::install')
  end

  it 'should disable Boundary if disabled' do
    expect(chef_run_disabled).to include_recipe('boundary_meter::disable')
  end
end
