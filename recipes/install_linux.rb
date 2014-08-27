package 'boundary-meter'

template "#{node[:boundary][:meter][:etc_path]}/meter.conf" do
  source 'meter.conf.erb'
  mode 600
end
