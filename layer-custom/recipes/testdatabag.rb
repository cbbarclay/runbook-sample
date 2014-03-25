mything = data_bag_item("myapp", "mysql")
#attribute_i_want = mything[node.chef_environment]
#Chef::Log.debug("The values are #{mything} ")
Chef::Log.info("The username is '#{mything[node.chef_environment]['username']}' ")
#Chef::Log.debug("The values are '#{mything['username']}' ")

appserver = search(:node, "role:php-app").first
Chef::Log.info("The private IP is '#{appserver[:private_ip]}'")
