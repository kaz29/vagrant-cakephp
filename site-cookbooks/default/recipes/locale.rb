#bash "add ja_JP.UTF-8 locale" do
##    cwd "/usr/local/src"
#    code <<-EOF
#        locale-gen ja_JP.UTF-8
#    EOF
#    not_if "locale -a | grep ja_JP.utf8"
#end

# apt-get install language-pack-ja
# update-locale LANG=ja_JP.UTF-8

#/etc/default/locale に LC_ALL=ja_JP.UTF-8 も追加しておく。

execute "update-locale LANG=ja_JP.UTF-8" do
    not_if "locale | grep LC_ALL | grep ja_JP"
end

template "/etc/default/locale" do
    source "locale.erb"
    mode 0644
    owner "root"
    group "root"
end
