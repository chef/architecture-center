require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :openwrt_download 
provides :openwrt_download, target_mode: true

property :source, String 
property :target, String 

load_current_value do |new_resource|
    backend = TargetModeHelper.new(__transport_connection)
    file = new_resource.target
    parsed = file.match(/([^\/]+$)/)
    if parsed
        file = parsed[1]
    end

    tmp = backend.run_command("ls -al %s || echo -n", new_resource.target)
    if tmp.match(Regexp.new(file))
        target new_resource.target 
    end
end 


action :create do
    backend = TargetModeHelper.new(__transport_connection)
    converge_if_changed :target do
        backend.run_command("uclient-fetch -O %s %s || echo -n", new_resource.target, new_resource.source)       
    end
end
