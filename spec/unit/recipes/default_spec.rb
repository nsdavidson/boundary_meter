require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

ChefSpec::Coverage.start!

describe 'boundary_meter::default' do
  # Setup chef run with Boundary enabled
  let(:chef_run) do
    ChefSpec::Runner.new.converge(described_recipe)
  end

  # Tests for recipe inclusion
  it 'should install chef-sugar' do
    expect(chef_run).to include_recipe('chef-sugar::default')
  end

  context 'Boundary enabled' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.automatic['boundary']['meter']['enabled'] = true
      end.converge(described_recipe)
    end
    it 'should include install if enabled' do
      expect(chef_run).to include_recipe('boundary_meter::install')
    end
  end

  context 'Boundary disabled' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.automatic['boundary']['meter']['enabled'] = false
      end.converge(described_recipe)
    end

    it 'should disable Boundary if disabled' do
      expect(chef_run).to include_recipe('boundary_meter::disable')
    end
  end
end
