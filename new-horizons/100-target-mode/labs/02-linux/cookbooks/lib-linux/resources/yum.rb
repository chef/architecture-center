require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :yum 
provides :yum, target_mode: true

#allowed_actions :install #, :upgrade, :remove, :purge, :reconfig, :lock, :unlock
property :package, String #, name_property: true

load_current_value do |new_resource|
    backend = TargetModeHelper.new(__transport_connection)

    tmp = backend.run_command("yum list installed %s || echo -n", new_resource.package)
    if tmp.match(Regexp.new(new_resource.package))
        package new_resource.package 
    end
end


action :create do
    backend = TargetModeHelper.new(__transport_connection)

    converge_if_changed :package do
        #backend.run_command(" update")
        backend.run_command("sudo yum install %s -y || echo -n", new_resource.package)
    end
end
