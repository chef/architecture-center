package 'httpd'

package 'nginx' do
  action :install
end

# Create the document root directory if it doesn't exist
directory "/var/www/html" do
  owner 'www-data'
  group 'www-data'
  mode '0755'
  recursive true
  action :create
end

template '/var/www/html/index.html' do # ~FC033
  source 'index.html.erb'
end