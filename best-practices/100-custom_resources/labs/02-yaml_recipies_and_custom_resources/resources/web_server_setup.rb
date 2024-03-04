resource_name :web_server_setup
provides :web_server_setup

property :server_name, String, name_property: true
property :document_root, String, default: '/var/www/html'
property :index_content, String, default: '<h1>Welcome to my web server!</h1>'

action :create do
  # Install the Apache package
  package 'httpd' do
    action :install
  end

  service 'httpd' do
    action [:enable, :start]
  end

  user 'www-data' do
  end

  group 'www-data' do
      append true
      members ['www-data']
  end

  # Create the document root directory if it doesn't exist
  directory new_resource.document_root do
    owner 'www-data'
    group 'www-data'
    mode '0755'
    recursive true
    action :create
  end

  # Create the index.html file with the specified content
  file "#{new_resource.document_root}/index.html" do
    content new_resource.index_content
    owner 'www-data'
    group 'www-data'
    mode '0644'
    action :create
  end
end
