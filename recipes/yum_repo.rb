arch =  if _64_bit?
          'x86_64'
        else
          'i386'
        end

if amazon_linux?
  version = "6"
else
  version = node[:platform_version]
end

yum_repository 'boundary' do
  description 'Boundary Stable'
  baseurl "#{node[:boundary][:meter][:yum][:url]}/centos/os/#{version}/#{arch}"
  gpgkey "#{node[:boundary][:meter][:yum][:url]}/RPM-GPG-KEY-Boundary"
  action :create
end
