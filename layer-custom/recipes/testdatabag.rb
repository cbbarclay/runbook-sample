mything = data_bag_item("myapp", "mysql")
#attribute_i_want = mything[node.chef_environment]
Chef::Log.debug("The values are #{mything} ")
Chef::Log.debug("The values are '#{mything[node.chef_environment]['username']}' ")

appserver = search(:node, "role:php-app").first
Chef::Log.debug("The private IP is '#{appserver[:private_ip]}'")
