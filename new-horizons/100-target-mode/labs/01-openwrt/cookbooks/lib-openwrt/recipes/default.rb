#
# Cookbook:: openwrt
# Recipe:: default

touch_file 'hello.txt' do
    file '~/hello.txt'
end

openwrt_directory 'Scripts' do
    directory '~/scripts' 
end

openwrt_download 'my ip' do
    source 'http://api.ipify.org'
    target '~/scripts/ip.txt'
end

openwrt_package 'base64' do
    package 'coreutils-base64'
end

openwrt_system_config '/etc/config/system' do
    hostname 'OpenWrt'
    conloglevel '7'
    notifies :reboot, "openwrt_reboot[reboot]", :delayed
end


openwrt_network_interface 'lan' do
    type 'bridge'
    ifname 'eth0'
    proto 'dhcp'
    netmask '255.255.0.0'
    notifies :reboot, "openwrt_reboot[reboot]", :delayed
end

openwrt_uci_firewall 'Allow-ISAKMP' do
    src         'wan'
    dest		'lan'
    dest_port	'500'
    proto		'udp'
    target	    'ACCEPT'
    notifies :commit, "openwrt_uci_apply[commit]", :immediately
end

openwrt_uci_firewall 'Block-FTP' do
    src         'wan'
    dest		'lan'
    dest_port	'21'
    target	    'REJECT'
    notifies :commit, "openwrt_uci_apply[commit]", :immediately
end

openwrt_uci_apply 'commit' do
    notifies :reboot, "openwrt_reboot[reboot]", :delayed
end

openwrt_reboot 'reboot' do
    delay 10
end
