bash "Rebuild pgcluster" do
    code <<-EOH
pg_dropcluster --stop 9.1 main
pg_createcluster --locale=ja_JP.UTF-8 --encoding=utf-8 9.1 main --start
sudo -u postgres createuser vagrant --superuser --createrole --createdb
sudo -u postgres createdb -O vagrant -E UTF8 cakephp
sudo -u postgres createdb -O vagrant -E UTF8 cakephp_test
touch /var/lib/postgresql/.rebuilded
EOH
    not_if { ::File.exists?("/var/lib/postgresql/.rebuilded")}
end

execute "service postgresql restart" do
  action :nothing
end

template "/etc/postgresql/9.1/main/pg_hba.conf" do
  owner "postgres"
  group "postgres"
  mode 0640
  source "pg_hba.conf.erb"
  notifies :run, resources(:execute => "service postgresql restart"), :immediately
end