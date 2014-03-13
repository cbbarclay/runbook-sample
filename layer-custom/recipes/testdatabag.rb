mything = data_bag_item("myapp", "rds")
attribute_i_want = mything[node.chef_environment]
Chef::Log.debug("The values are #{attribute_i_want} ")
