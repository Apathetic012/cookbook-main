phpunit_location = "#{Chef::Config[:file_cache_path]}/phpunit.phar"

remote_file phpunit_location do
  source 'http://pear.phpunit.de/get/phpunit.phar'
  action :create_if_missing
  mode 0755
  notifies :run, 'bash[install_phpunit]'
end

bash 'install_phpunit' do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    ln -s #{phpunit_location} #{phpunit_executable_path}
  EOH
  action :nothing
end
