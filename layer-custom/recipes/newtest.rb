mything = data_bag_item("myapp", "rds")
Chef::Log.debug("The username is '#{mything[node.chef_environment]['username']}' ")
