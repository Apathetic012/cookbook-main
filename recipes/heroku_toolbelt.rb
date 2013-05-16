if node[:vagrant_main][:install_heroku]
  bash "install heroku toolbelt" do
    code <<-EOH
      curl -s http://assets.heroku.com.s3.amazonaws.com/heroku-client/heroku-client.tgz | tar xz
      mv heroku-client /opt
      ln -s /opt/heroku-client/bin/heroku /usr/local/bin/heroku
    EOH
    action :run
    not_if "which heroku"
  end
end
