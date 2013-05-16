phpunit_location = "/opt/composer/phpunit.phar"
directory "/opt/composer"

remote_file phpunit_location do
  source 'http://pear.phpunit.de/get/phpunit.phar'
  action :create_if_missing
  mode 0755
  notifies :run, 'bash[install_phpunit]'
end

bash 'install_phpunit' do
  code <<-EOH
    ln -s #{phpunit_location} #{node[:vagrant_main][:phpunit_executable_path]}
  EOH
  action :nothing
end
