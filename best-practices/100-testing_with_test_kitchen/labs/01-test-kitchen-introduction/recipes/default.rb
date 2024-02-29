package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

#file '/var/www/html/index.html' do
#  content new_resource.homepage
#end


template '/var/www/html/index.html' do # ~FC033
  source 'index.html.erb'
end
