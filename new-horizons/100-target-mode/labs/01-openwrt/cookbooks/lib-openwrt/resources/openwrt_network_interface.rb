require 'OpenWRT' unless defined?(OpenWRT)
require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :openwrt_network_interface 
provides :openwrt_network_interface, target_mode: true

property :name, name_property: true
property :type
property :ifname
property :proto
property :ipaddress
property :netmask
property :gateway

# Load the current value for content and mode

load_current_value do |new_resource|
    backend = TargetModeHelper.new(__transport_connection)
    src = backend.read_text_file("/etc/config/network")
    cfg = OpenWRT::Config::Network.new
    cfg.parse(src)

    if cfg.interfaces.has_key?( new_resource.name )
        iface = cfg.interfaces[new_resource.name]

        name        iface.option["name"]        if iface.option.has_key?( "name" )
        type        iface.option["type"]        if iface.option.has_key?( "type" )
        ifname      iface.option["ifname"]      if iface.option.has_key?( "ifname" )
        proto       iface.option["proto"]       if iface.option.has_key?( "proto" )
        ipaddress   iface.option["ipaddr"]      if iface.option.has_key?( "ipaddr" )
        netmask     iface.option["netmask"]     if iface.option.has_key?( "netmask" )
        gateway     iface.option["gateway"]     if iface.option.has_key?( "gateway" )

    end

end

action :create do


    converge_if_changed do
        backend = TargetModeHelper.new(__transport_connection)
        src = backend.read_text_file("/etc/config/network")
        cfg = OpenWRT::Config::Network.new(content: src)

        iface = {}
        if cfg.interfaces.has_key?( new_resource.name )
            iface = cfg.interfaces[new_resource.name]
        else
            iface = OpenWRT::Config::Network::Interface_Block.new
            cfg.interfaces[new_resource.name] = iface
        end

        iface.option["name"]       = new_resource.name         if property_is_set?(:name)
        iface.option["type"]       = new_resource.type         if property_is_set?(:type)
        iface.option["ifname"]     = new_resource.ifname       if property_is_set?(:ifname)
        iface.option["proto"]      = new_resource.proto        if property_is_set?(:proto)
        iface.option["ipaddr"]     = new_resource.ipaddress    if property_is_set?(:ipaddress)
        iface.option["netmask"]    = new_resource.netmask      if property_is_set?(:netmask)
        iface.option["gateway"]    = new_resource.gateway      if property_is_set?(:gateway)

       
        backend.write_text_file("/etc/config/network", cfg.to_string())
    end

end