if node[:vagrant_main][:install_heroku]
  execute "install heroku toolbelt" do
    command "wget -qO- https://toolbelt.heroku.com/install.sh | /bin/bash"
    action :run
    not_if "which heroku"
  end
end
