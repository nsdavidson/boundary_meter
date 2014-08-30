require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

describe 'boundary_meter::default' do
  # Setup chef run simulating Dell hardware and Linux OS
  let(:chef_run_rhel) do
    ChefSpec::Runner.new(platform: 'redhat', version: '6.4') do |node|
      node.automatic['boundary']['api']['org_id'] = "my_org_id"
      node.automatic['boundary']['api']['key'] = "my_api_key"
    end.converge(described_recipe)
  end

  # Stub out provisioning
  before do
    stub_command("./boundary-meter-provision -i dummy_token").and_return(1)
  end

  # Tests for Red Hat based distros
  it 'install chef-sugar' do
    expect(chef_run_rhel).to include_recipe('chef-sugar::default')
  end
end
