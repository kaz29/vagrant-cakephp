template "/etc/apache2/sites-available/#{node[:vhostname]}.conf" do
    owner "root"
    group "root"
    mode 0644
    source "www.conf.erb"
end

link "/etc/apache2/sites-enabled/#{node[:vhostname]}.conf" do
    link_type :symbolic
    to "/etc/apache2/sites-available/#{node[:vhostname]}.conf"
    not_if { ::File.exists?("/etc/apache2/sites-enabled/#{node[:vhostname]}.conf")}
end

bash "enable mod_rewrite" do
    code <<-EOH
a2enmod rewrite
EOH
    not_if { ::File.exists?("/etc/apache2/mods-enabled/rewrite.load")}
end

bash "enable mod_headers" do
    code <<-EOH
a2enmod headers
EOH
    not_if { ::File.exists?("/etc/apache2/mods-enabled/headers.load")}
end

%w{apache2}.each do |service_name|
    service service_name do
      action [:start, :restart]
    end
end
