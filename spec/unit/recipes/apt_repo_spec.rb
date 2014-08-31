require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

describe 'boundary_meter::apt_repo' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
  end

  it 'should add apt repo' do
    expect(chef_run).to add_apt_repository('boundary')
  end
end
