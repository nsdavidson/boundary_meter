default[:boundary][:meter][:bin_path] = "/usr/bin"
default[:boundary][:meter][:etc_path] = "/etc/boundary"
default[:boundary][:meter][:collector][:hostname] = "collector.boundary.com"
default[:boundary][:meter][:collector][:port] = "4740"

default[:boundary][:meter][:tags] = []

default[:boundary][:meter][:interfaces] = nil

default[:boundary][:meter][:enabled] = true

default[:boundary][:meter][:yum][:url] = 'https://yum.boundary.com'
default[:boundary][:meter][:apt][:url] = 'https://apt.boundary.com'
