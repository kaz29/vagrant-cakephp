# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :forwarded_port, guest: 80, host: 8080

  src_dir = './'
  dotdeb = {type: 'squeeze-php54'}
  docroot = '/vagrant_data/app/webroot'
  vhostname = 'localhost'
  #backendbasepath = '/api'
  backendpath = '/vagrant_data/app/webroot'
  packages = [
    'curl', 'git', 'vim', 'tree', 'language-pack-ja',
    'apache2', 'apache2-mpm-prefork', 'apache2-utils', 'libapache2-mod-php5',
    'php5', 'php5-cli', 'php5-curl', 'php-pear', 'php5-pgsql', 'php5-gd', 'php5-xdebug', 'php5-zendopcache',
    'postgresql'
  ]
  # default::app
  recipes = ['default::php', 'default::cakephp', 'default::site', 'default::postgresql', 'default::composer', 'default::bakeproject']

  config.vm.synced_folder src_dir, "/vagrant_data", :create => true, :owner=> 'vagrant', :group=>'www-data', :mount_options => ['dmode=775','fmode=775']

  config.vm.provision :chef_solo do |chef|
    #chef.log_level = "debug"
    chef.cookbooks_path = ["./site-cookbooks"]
    chef.add_recipe "default"
    chef.json = { 
      recipe_list: recipes,
      packages: packages,
      docroot: docroot,
      vhostname: vhostname,
      #backendbasepath: backendbasepath,
      backendpath: backendpath,
      dotdeb: dotdeb
    }
  end
end
