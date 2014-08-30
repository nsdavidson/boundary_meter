require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

describe 'boundary_meter::install' do
  context 'rhel' do
    # Tests RHEL installs
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'redhat', version: '6.4').converge(described_recipe)
    end

    it 'should include yum_repo recipe' do
      expect(chef_run).to include_recipe('boundary_meter::yum_repo')
    end

    it 'should include install_linux recipe' do
      expect(chef_run).to include_recipe('boundary_meter::install_linux')
    end
  end

  # Test Ubuntu install
  context 'ubuntu' do
    let(:chef_run) do
      ChefSpec::Runner.new(platform: 'ubuntu', version: '14.04').converge(described_recipe)
    end

    it 'should include apt_repo recipe' do
      expect(chef_run).to include_recipe('boundary_meter::apt_repo')
    end

    it 'should include install_linux recipe' do
      expect(chef_run).to include_recipe('boundary_meter::install_linux')
    end
  end
end
