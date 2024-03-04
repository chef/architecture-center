resource_name :web_server_setup
provides :web_server_setup

property :server_name, String, name_property: true

action :create do     

package 'nginx' do
    action :install
    end
    
    service 'nginx' do
    action [ :enable, :start ]
    end
    
    include_profile 'action-specific::web_server_profile'      
end
