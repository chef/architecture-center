require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :switch_user 
provides :switch_user, target_mode: true
property :user, String

load_current_value do |new_resource|
    backend = TargetModeHelper.new(__transport_connection)

    expect = new_resource.user
    tmp = backend.run_command( "whoami || echo -n") 
    if tmp.match(expect)
        user new_resource.user 
    end

end


action :create do
    backend = TargetModeHelper.new(__transport_connection)

    converge_if_changed do
        backend.run_command( "sudo su %s", new_resource.user) 
      end
end
