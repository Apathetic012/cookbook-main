node['vagrant-main']['gems'].each do |gem|
  chef_gem gem
end
