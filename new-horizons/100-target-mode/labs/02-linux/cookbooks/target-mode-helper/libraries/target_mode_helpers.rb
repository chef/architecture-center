require "base64" unless defined?(Base64)

class TargetModeHelper
    def empty(x)
        return (not x.nil? and x.strip.empty?)
    end

    def initialize(backend)
        @backend = backend
    end

    def run_command(command, *args, debug: false)
        unix_cmd = sprintf(command, *args)
        cmd = @backend.run_command( unix_cmd )

        if debug
            puts ""
            puts "**************************************************"
            puts "TargetModeHelper.run_command"
            puts sprintf("Command: %s", unix_cmd)
            puts sprintf("stdout: %s", cmd.stdout)
            puts sprintf("stderr: %s", cmd.stderr)
            puts "**************************************************"
        end

        return cmd.stdout
    end

    def read_text_file(file)
        unix_cmd = sprintf("cat %s || echo -n", file)
        return @backend.run_command( unix_cmd ).stdout
    end
    def write_text_file(file, contents)
        encoded = Base64.strict_encode64(contents)        
        unix_cmd = format("echo '%<base64>s' | base64 --decode > %<file>s", base64: encoded, file: file)
        return @backend.run_command( unix_cmd ).stdout
    end
end