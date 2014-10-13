name             'boundary_meter'
maintainer       'Nolan Davidson'
maintainer_email 'nolan.davidson@gmail.com'
license          'MIT'
description      'Installs/Configures boundary_meter'
long_description 'Installs/Configures boundary_meter'
version          '0.2.4'

depends 'chef-sugar'
depends 'yum', '> 3.0'
depends 'apt'

%w{ amazon redhat centos scientific fedora ubuntu }.each do |os|
  supports os
end
