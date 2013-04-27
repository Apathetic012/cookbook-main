node['vagrant-main']['apt_packages'].each do |pkg|
  package pkg do
    action :install
  end
end
