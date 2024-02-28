require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :openwrt_uci_apply 
provides :openwrt_uci_apply, target_mode: true#, platform: "linux"

default_action :nothing 

action :nothing do
  #this is an empty resource action
end

action :create do
  #this is an empty resource action
end

action :commit do
    backend = TargetModeHelper.new(__transport_connection)
    backend.run_command(sprintf("uci commit"))
end





