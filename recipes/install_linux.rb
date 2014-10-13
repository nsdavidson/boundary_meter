etc_path = node[:boundary][:meter][:etc_path]

directory etc_path
template "#{etc_path}/meter.conf" do
  source 'meter.conf.erb'
  mode 0600
end

package 'boundary-meter'

install_token = "#{node[:boundary][:api][:org_id]}:#{node[:boundary][:api][:key]}"

bash 'provision' do
  cwd node[:boundary][:meter][:bin_path]
  code <<-EOH
    ./boundary-meter-provision -i #{install_token}
    EOH
  not_if { ::File.exist?("#{etc_path}/key.pem") }
  notifies :run, "bash[tag]", :delayed
end

service 'boundary-meter' do
  action [:enable, :start]
end

tags = node[:boundary][:meter][:tags].join(",")
bash 'tag' do
  cwd node[:boundary][:meter][:bin_path]
  code <<-EOH
    ./boundary-meter -p #{install_token} -o #{tags}
    EOH
  action :nothing
  not_if { node[:boundary][:meter][:tags].empty? }
end
