require 'chefspec'
require 'chefspec/berkshelf'
require 'fauxhai'

describe 'boundary_meter::install_linux' do
  let(:chef_run) do
    ChefSpec::Runner.new(platform: 'redhat', version: '6.4') do |node|
        node.set[:boundary][:meter][:etc_path] = '/etc/boundary'
        node.set[:boundary][:meter][:bin_path] = '/usr/bin'
        node.set[:boundary][:api][:org_id] = 'test123'
        node.set[:boundary][:api][:key] = "supersecretkey"
        node.set[:boundary][:meter][:tags] = ["mytag"]
    end.converge(described_recipe)
  end

  it 'should create the config directory at etc_path' do
    expect(chef_run).to create_directory('/etc/boundary')
  end

  it 'should create meter.conf from template' do
    expect(chef_run).to create_template('/etc/boundary/meter.conf')
  end

  it 'should render meter.conf with content' do
    expect(chef_run).to render_file('/etc/boundary/meter.conf').with_content("test123")
  end

  it 'should install boundary-meter package' do
    expect(chef_run).to install_package('boundary-meter')
  end

  it 'should provision and tag the meter if not already provisioned' do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with('/etc/boundary/key.pem').and_return(false)
    expect(chef_run).to run_bash('provision')
    expect(chef_run.bash('provision')).to notify('bash[tag]').to(:run)
  end

  it 'should not provision and tag the meter if already provisioned' do
    allow(File).to receive(:exist?).and_call_original
    allow(File).to receive(:exist?).with('/etc/boundary/key.pem').and_return(true)
    expect(chef_run).to_not run_bash('provision')
  end

  it 'should start and enable the boundary service' do
    expect(chef_run).to enable_service('boundary-meter')
    expect(chef_run).to start_service('boundary-meter')
  end
end
