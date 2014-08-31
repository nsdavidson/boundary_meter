source 'https://rubygems.org'

gem 'berkshelf', '> 3'

# Uncomment these lines if you want to live on the Edge:
#
# group :development do
#   gem "berkshelf", github: "berkshelf/berkshelf"
#   gem "vagrant", github: "mitchellh/vagrant", tag: "v1.5.2"
# end
#
# group :plugins do
#   gem "vagrant-berkshelf", github: "berkshelf/vagrant-berkshelf"
#   gem "vagrant-omnibus", github: "schisamo/vagrant-omnibus"
# end

group :development do
  gem 'test-kitchen'
  gem 'kitchen-vagrant'
  gem 'vagrant-wrapper'
  gem 'kitchen-ec2'
end

group :test do
  gem 'chefspec'
  gem 'rubocop'
  gem 'chef-sugar'
  gem 'foodcritic'
end
