directory "#{node['docroot']}" do
    mode 00775
    owner "www-data"
    group "devel"
    recursive true
    action :create
end
