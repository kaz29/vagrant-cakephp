template "/etc/php5/mods-available/timezone.ini" do
  owner "root"
  group "root"
  mode 0644
  backup 0
  source "timezone.ini.erb"
end

link "/etc/php5/conf.d/99-timezone.ini" do
	link_type :symbolic
	to "/etc/php5/mods-available/timezone.ini"
end

execute "phpunit-install" do
  command "pear config-set auto_discover 1; pear install pear.phpunit.de/PHPUnit"
  not_if { ::File.exists?("/usr/bin/phpunit")}
end

execute "composer-install" do
  command "curl -sS https://getcomposer.org/installer | php ;mv composer.phar /usr/local/bin/composer"
  not_if { ::File.exists?("/usr/local/bin/composer")}
end
