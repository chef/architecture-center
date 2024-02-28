require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :touch_file 
provides :touch_file, target_mode: true#, platform: "linux"

property :file, String, description: "The full path to the file, including the file name and its extension. For example: /files/file.txt. Default value: the name of the resource block. Microsoft Windows: A path that begins with a forward slash `/` will point to the root of the current working directory of the #{ChefUtils::Dist::Infra::PRODUCT} process. This path can vary from system to system. Therefore, using a path that begins with a forward slash `/` is not recommended."

load_current_value do |new_resource|
  backend = TargetModeHelper.new(__transport_connection)

  fileName = new_resource.file
  parsed = fileName.match(/([^\/]+$)/)
  dir = ""
  if parsed
    dir = dir[0.. (dir.length - parsed[1].length-1)]
    fileName = parsed[1];
  end

  tmp = backend.run_command("ls -l %s | grep %s", dir, fileName)
  if tmp.match(Regexp.new(fileName))
    file new_resource.file 
  end

end


action :create do  
  backend = TargetModeHelper.new(__transport_connection)

  converge_if_changed do
    backend.run_command('touch %s', new_resource.file)
  end
end