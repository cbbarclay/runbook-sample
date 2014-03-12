script "install_plugin_es_head" do
	interpreter "bash"
	user "root"
	cwd "#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/bin/"
	code <<-EOH
  	plugin -install mobz/elasticsearch-head
     plugin -install river-jdbc -url http://bit.ly/1dKqNJy
     curl -o mysql-connector-java-5.1.28.zip -L 'http://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.28.zip/from/http://cdn.mysql.com/'
     unzip mysql-connector-java-5.1.28.zip
     cp mysql-connector-java-5.1.28/mysql-connector-java-5.1.28-bin.jar ../plugins/river-jdbc
curl -XPUT 'localhost:9200/_river/my_jdbc_river/_meta' -d '{
    "type" : "jdbc",
    "jdbc" : {
        "url" : "jdbc:mysql://localhost:3306/test",
        "user" : "test",
        "password" : "test",
        "sql" : "select * from orders"
    }
}'
  	EOH
	not_if { File.exist?("#{node.elasticsearch[:dir]}/elasticsearch-#{node.elasticsearch[:version]}/plugins/head") }
end

#notifies :restart, 'service[elasticsearch]' unless node.elasticsearch[:skip_restart]
