bash "Bake Application" do
    code <<-EOH
cd /vagrant_data
yes | Vendor/bin/cake bake project app
EOH
    not_if { ::File.exists?("/vagrant_data/app/webroot/.htaccess")}
end

template "/vagrant_data/app/Config/database.php" do
  owner "vagrant"
  group "vagrant"
  mode 0644
  source "database.php.erb"
  not_if { ::File.exists?("/vagrant_data/app/Config/database.php")}
end
