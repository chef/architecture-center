#
# Cookbook:: web_server
# Recipe:: default
#

unless ubuntu_platform?
  log "Unsupported platform: #{node['platform']}"
  return
end

apt_update 'update' do
  ignore_failure true
  action :update
  only_if { ubuntu_platform? }
end

package 'nginx' do
  action :install
end

service 'nginx' do
  action [ :enable, :start ]
end

include_profile 'web_server::web_server_profile'
