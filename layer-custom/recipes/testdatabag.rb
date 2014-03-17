mything = data_bag_item("myapp", "mysql")
#attribute_i_want = mything[node.chef_environment]
Chef::Log.debug("The values are #{mything} ")
Chef::Log.debug("The values are '#{my_data_bag_item[node.chef_environment]['username']}' ")
