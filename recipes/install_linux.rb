etc_path = node[:boundary][:meter][:etc_path]

directory "#{etc_path}"
template "#{etc_path}/meter.conf" do
  source 'meter.conf.erb'
  mode 600
end

package 'boundary-meter'

install_token = "#{node[:boundary][:api][:org_id]}:#{node[:boundary][:api][:key]}"

bash 'provision' do
  cwd node[:boundary][:meter][:bin_path]
  code <<-EOH
    ./boundary-meter-provision -i #{install_token}
    EOH
  not_if { ::File.exists?("#{etc_path}/key.pem") }
end

service 'boundary-meter' do
  action [:enable, :start]
end