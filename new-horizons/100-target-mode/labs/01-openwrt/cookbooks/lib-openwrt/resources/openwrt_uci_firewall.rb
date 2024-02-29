require 'OpenWRT' unless defined?(OpenWRT)
require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :openwrt_uci_firewall 
provides :openwrt_uci_firewall, target_mode: true

property :name, name_property: true		#'Reject LAN to WAN for custom IP'
property :src		#'lan'
property :src_ip	#'192.168.1.2'
property :src_mac	#'00:11:22:33:44:55'
property :src_port	#'80'
property :dest		#'wan'
property :dest_ip	#'194.25.2.129'
property :dest_port	#'120'
property :proto		#'tcp'
property :target	#'REJECT'
property :enabled	#'0'

# Load the current value for content and mode
load_current_value do |new_resource|
    backend = TargetModeHelper.new(__transport_connection)
    
    #this should be an action class method
    stdout = backend.run_command( "uci show firewall | grep -F .name=\\'%s\\'", new_resource.name, debug: false) 
    pattern = "firewall\\.@rule\\[(\\d+)\\]\\.name='#{new_resource.name}'"
    index = stdout.match(Regexp.new(pattern)) #find the index of the rule if it exists

    if index
        index  = index[1]
    else
        index = nil 
    end  

    if index
        stdout = backend.run_command( "uci show firewall | grep -F @rule[%s]", index) 
        stdout.split(/\r?\n|\r/) do |line|       
            pattern = "firewall\\.@rule\\[#{index}\\]\\.(\\w+)='(.*?)'"
            attribs = line.match(pattern)
            if attribs
                name attribs[2] if attribs[1] == "name"
                src attribs[2] if attribs[1] == "src"
                src_ip attribs[2] if attribs[1] == "src_ip"
                src_mac attribs[2] if attribs[1] == "src_mac"
                src_port attribs[2] if attribs[1] == "src_port"
                dest attribs[2] if attribs[1] == "dest"
                dest_ip attribs[2] if attribs[1] == "dest_ip"
                dest_port attribs[2] if attribs[1] == "dest_port"
                proto attribs[2] if attribs[1] == "proto"
                target attribs[2] if attribs[1] == "target"
                enabled attribs[2] if attribs[1] == "enabled"
            end
        end

    end


end

action :create do

    echo = false

    converge_if_changed do
        backend = TargetModeHelper.new(__transport_connection)

        #this should be an action class method
        stdout = backend.run_command( "uci show firewall | grep -F .name=\\'%s\\'", new_resource.name) 
        pattern = "firewall\\.@rule\\[(\\d+)\\]\\.name='#{new_resource.name}'"
        index = stdout.match(Regexp.new(pattern)) #find the index of the rule if it exists

        if index
            index  = index[1]
        else
            backend.run_command( "uci add firewall rule", new_resource.name, debug: echo) 
            #backend.run_command( "uci set firewall.@rule[%s]='%s'", index, "rule", debug: echo)
            index = "-1"
        end  

        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "name", new_resource.name, debug: echo)             if property_is_set?(:name)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "src", new_resource.src, debug: echo)               if property_is_set?(:src)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "src_ip", new_resource.src_ip, debug: echo)         if property_is_set?(:src_ip)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "src_mac", new_resource.src_mac, debug: echo)       if property_is_set?(:src_mac)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "src_port", new_resource.src_port, debug: echo)     if property_is_set?(:src_port)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "dest", new_resource.dest, debug: echo)             if property_is_set?(:dest)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "dest_ip", new_resource.dest_ip, debug: echo)       if property_is_set?(:dest_ip)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "dest_port", new_resource.dest_port, debug: echo)   if property_is_set?(:dest_port)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "proto", new_resource.proto, debug: echo)           if property_is_set?(:proto)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "target", new_resource.target, debug: echo)         if property_is_set?(:target)
        backend.run_command( "uci set firewall.@rule[%s].%s='%s'", index, "enabled", new_resource.enabled, debug: echo)       if property_is_set?(:enabled)

    end

end