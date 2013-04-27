node['vagrant-main']['php_ini_paths'].each do |path|
  template path do
    source 'php.ini.erb'
  end
end
