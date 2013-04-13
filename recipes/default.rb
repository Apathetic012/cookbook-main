packages = %w[php5-common php5-cli php5-curl php5-fpm php5-gd php5-mysql imagemagick tmux postgresql postgresql-client libpq-dev php5-pgsql]

packages.each do |pkg|
  package pkg do
    action :install
  end
end

chef_gem "compass"
chef_gem "bundler"
chef_gem "jekyll"

remote_file "#{Chef::Config[:file_cache_path]}/distribute_setup.py" do
  source "http://python-distribute.org/distribute_setup.py"
end

bash "install_distribute" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    python distribute_setup.py
  EOH
  not_if File.exists?("#{Chef::Config[:file_cache_path]}/distribute_setup.py")
end
