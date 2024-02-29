require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :openwrt_directory 
provides :openwrt_directory, target_mode: true

property :directory, String

load_current_value do |new_resource|
    backend = TargetModeHelper.new(__transport_connection)

    dir = new_resource.directory
    parsed = dir.match(/([^\/]+$)/)
    path = ""
    if parsed
        path = dir[0.. (dir.length - parsed[1].length-1)]
        dir = parsed[1];
    end

    tmp = backend.run_command( "ls -l %s | grep %s || echo -n", path, dir) 
    if tmp.match(Regexp.new(dir))
        directory new_resource.directory 
    end

end


action :create do
    backend = TargetModeHelper.new(__transport_connection)

    converge_if_changed do
        backend.run_command( "mkdir %s", new_resource.directory) 
      end
end
