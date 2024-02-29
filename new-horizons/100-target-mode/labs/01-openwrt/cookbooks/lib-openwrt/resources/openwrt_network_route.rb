require 'OpenWRT' unless defined?(OpenWRT)
require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :openwrt_network_route 
provides :openwrt_network_route, target_mode: true

property :target
property :gateway
property :interface

# Load the current value for content and mode

load_current_value do |new_resource|
    backend = TargetModeHelper.new(__transport_connection)
    src = backend.read_text_file("/etc/config/network")
    cfg = OpenWRT::Config::Network.new
    cfg.parse(src)

    route = cfg.routes.select { |route| route.matches(target: new_resource.target, interface: new_resource.interface ) }
    if route.length() == 1
        route = route.first
        target         route.option["target"]         if route.option.has_key?( "target" )
        gateway        route.option["gateway"]        if route.option.has_key?( "gateway" )
        interface      route.option["interface"]      if route.option.has_key?( "interface" )
    end

end

action :create do

    converge_if_changed do
        backend = TargetModeHelper.new(__transport_connection)
        src = backend.read_text_file("/etc/config/network")
        cfg = OpenWRT::Config::Network.new(content: src)

        route = cfg.routes.select { |route| route.matches(target: new_resource.target, interface: new_resource.interface ) }
        if route.length() == 1
            route = route.first
        else 
            route = OpenWRT::Config::Network::Route_Block.new
            cfg.routes.append(route)
        end

        route.option["target"]        = new_resource.target          if property_is_set?(:target)
        route.option["gateway"]       = new_resource.gateway         if property_is_set?(:gateway)
        route.option["interface"]     = new_resource.interface       if property_is_set?(:interface)
       
        backend.write_text_file("/etc/config/network", cfg.to_string())
    end

end