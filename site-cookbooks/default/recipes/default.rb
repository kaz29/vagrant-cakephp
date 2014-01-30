#
# Cookbook Name:: webapp
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "default::dotdeb"
include_recipe "default::apt"
include_recipe "default::locale"

node['recipe_list'].each do |recipe|
	include_recipe recipe
end
