resource_name :web_server_setup

property :server_name, String, name_property: true
property :document_root, String, default: '/var/www/html'
property :index_content, String, default: '<h1>Welcome to my web server!</h1>'

action :create do
  # Install the Apache package
  package 'apache2' do
    action :install
  end

  # Ensure the Apache service is running and enabled
  service 'apache2' do
    action [:enable, :start]
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
