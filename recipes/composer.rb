composer_location = "/opt/composer/composer.phar"
directory "/opt/composer"

remote_file composer_location do
  source "https://getcomposer.org/composer.phar"
  mode 0755
  action :create_if_missing
  not_if "test -f #{composer_location}"
  notifies :run, "bash[install_composer]"
end

bash 'install_composer' do
  code <<-EOH
    ln -s #{composer_location} #{node[:vagrant_main][:composer_executable_path]}
  EOH
  action :nothing
end
