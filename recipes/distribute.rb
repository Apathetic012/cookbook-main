remote_file "#{Chef::Config[:file_cache_path]}/distribute_setup.py" do
  source "http://python-distribute.org/distribute_setup.py"
  action :create_if_missing
  notifies :run, "bash[install_distribute]"
end

bash "install_distribute" do
  cwd Chef::Config[:file_cache_path]
  code <<-EOH
    python distribute_setup.py
  EOH
  action :nothing
end
