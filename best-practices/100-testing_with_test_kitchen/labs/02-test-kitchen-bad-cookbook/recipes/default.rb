#user 'www-data' do
#end

#group 'www-data' do
#    members ['www-data']
#end

directory "/var/www/html" do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  recursive true
  action :create
end
