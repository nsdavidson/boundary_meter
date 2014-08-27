include_recipe "apt"

apt_repository 'boundary' do
  uri "#{node[:boundary][:meter][:apt][:url]}/ubuntu/"
  distribution node[:lsb][:codename]
  components ["universe"]
  key "#{node[:boundary][:meter][:apt][:url]}/APT-GPG-KEY-Boundary"
  action :add
end
