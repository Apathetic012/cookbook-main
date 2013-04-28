node[:vagrant_main][:php_ini_paths].each do |path|
  template path do
    source 'php.ini.erb'
  end
end

composer_location = "#{Chef::Config[:file_cache_path]}/composer.phar"
composer_executable_path = node[:vagrant_main][:composer_executable_path]

remote_file composer_location do
  source "https://getcomposer.org/composer.phar"
  mode 0755
  action :create_if_missing
  not_if "test -f #{composer_location}"
  notifies :run, "bash[install_composer]"
end

bash 'install_composer' do
  code <<-EOH
    ln -s #{composer_location} #{composer_executable_path}
  EOH
  action :nothing
end
