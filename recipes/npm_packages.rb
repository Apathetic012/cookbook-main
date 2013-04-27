node['vagrant-main']['npm_packages'].each do |package|
  npm_package package
end

