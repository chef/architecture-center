web_server_setup 'my_web_server' do
  server_name 'example.com'
  document_root '/var/www/example'
  index_content '<h1>Welcome to example.com!</h1>'
  action :create
end