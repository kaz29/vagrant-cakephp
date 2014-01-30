bash "Composer update" do
    code <<-EOH
cd /vagrant_data
composer update
EOH
end
