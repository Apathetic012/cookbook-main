node[:vagrant_main][:ruby_gems].each do |gem|
  chef_gem gem
end
