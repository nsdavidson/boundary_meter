require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

describe 'boundary_meter::yum_repo' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'redhat', version: '6.4').converge(described_recipe)
  end

  it 'should add yum repo' do
    expect(chef_run).to create_yum_repository('boundary')
  end
end
