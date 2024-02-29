class OpenWRT
    class Config    
        class System
            class System_Block
                Pattern = /config system/

                attr_accessor :hostname	            #string	    no	OpenWrt	The hostname for this system. Avoid points, even if they are within quotes. For example ' my.hostname ' will show only the ' my ' part
                attr_accessor :description	        #string	    no	(none)	A short, single-line description for this system. It should be suitable for human consumption in user interfaces, such as LuCI, selector UIs in remote administration applications, or remote UCI (over ubus RPC).
                attr_accessor :notes	            #string	    no	(none)	A multi-line, free-form text field about this system that can be used in any way the user wishes, e.g. to hold installation notes, or unit serial number and inventory number, location, etc.
                attr_accessor :buffersize	        #integer	no	kernel specific	Size of the kernel message buffer.
                attr_accessor :conloglevel	        #integer	no	7	Number between 1-8. The maximum log level for kernel messages to be logged to the console. Only messages with a level lower than this will be printed to the console. Higher level messages have lower log level number. Highest level messages are ones with log level 0. If you want more verbose messages in console put conloglevel to 8 if you want less messages lower conloglevel to 4 or even less. This option and similar parameters may not be effective since 17.x and later.
                attr_accessor :cronloglevel	        #integer	no	5	The minimum level for cron messages to be logged to syslog. 0 will print all debug messages, 8 will log command executions, and 9 or higher will only log error messages.
                attr_accessor :klogconloglevel	    #integer	no	7	The maximum log level for kernel messages to be logged to the console. Only messages with a level lower than this will be printed to the console. Identical to conloglevel and will override it.
                attr_accessor :log_buffer_size	    #integer	no	(none)	Size of the log buffer of the procd based system log, that is accessible via the logread command. Defaults to the value of log_size if unset.
                attr_accessor :log_file	            #string	    no	no log file	File to write log messages to (type file). The default is to not write a log in a file. The most often used location for a system log file is /var/log/messages.
                attr_accessor :log_hostname	        #string	    no	(none)	Hostname to send to remote syslog. If none is provided, the actual hostname is send. This feature is only present in 17.xx and later versions
                attr_accessor :log_ip	            #IP address	no	(none)	IP address of a syslog server to which the log messages should be sent in addition to the local destination.
                attr_accessor :log_port	            #integer	no	514	Port number of the remote syslog server specified with log_ip.
                attr_accessor :log_prefix	        #string	    no	(none)	Adds a prefix to all log messages send over network.
                attr_accessor :log_proto	        #string	    no	udp	Sets the protocol to use for the connection, either tcp or udp.
                attr_accessor :log_remote	        #bool	    no	1	Enables remote logging.
                attr_accessor :log_size	            #integer	no	64	Size of the file based log buffer in KiB (see log_file). This value is used as the fallback value for log_buffer_size if the latter is not specified.
                attr_accessor :log_trailer_null	    #bool	    no	0	Use \0 instead of \n as trailer when using TCP.
                attr_accessor :log_type	            #string	    no	circular	Either circular or file. The circular option is a fixed size queue in memory, while the file is a dynamically sized file, that can be in memory, or written to disk. Note: If log_type is set to file, then at some point when the log fills, the device may encounter an out-of-space condition. This is especially an issue for devices with limited onboard storage: in memory, or on flash.
                attr_accessor :ttylogin	            #bool	    no	0	Require authentication for local users to log in the system. Disabled by default. It applies to the access methods listed in /etc/inittab, such as keyboard and serial.
                attr_accessor :urandom_seed	        #string	    no	0	Path of the seed. Enables saving a new seed on each boot.
                attr_accessor :timezone	            #string	    no	UTC	POSIX.1 time zone string corresponding to the time zone in which date and time should be displayed by default. See timezone database for a mapping between IANA/Olson and POSIX.1 formats. (For London this corresponds to GMT0BST,M3.5.0/1,M10.5.0)
                attr_accessor :zonename	            #string	    no	UTC	IANA/Olson time zone string. If zoneinfo-* packages are present, possible values can be found by running find /usr/share/zoneinfo. See timezone database for a mapping between IANA/Olson and POSIX.1 formats. (For London this corresponds to Europe/London)
                attr_accessor :zram_comp_algo	    #string	    no	lzo	Compression algorithm to use for ZRAM, can be one of lzo, lzo-rle, lz4, zstd
                attr_accessor :zram_size_mb	        #integer	no	Ramsize in kB divided by 2048	Size of ZRAM in MB

                def initialize()
                end

                def init(args)
                end

                def parse(line)
                    result = line.match(/\soption\s(\w+)\s'(\w+)'/)
                    if result
                        self.instance_variable_set("@" + result[1],  result[2])
                    end
                end

                def to_string()
                    buffer = ""
                    buffer << sprintf("config system\n")

                    self.instance_variables.each do |var|
                        key = var.to_s.tr('@', '')                        
                        value = self.instance_variable_get(var)
                        buffer << sprintf("\t option %s '%s'\n", key, value)
                    end

                    return buffer
                end                          
            end

            class Timeserver_Block
                Pattern = /config timeserver '(\w+)'/

                def initialize()
                end

                def init(args)
                    @name = args[1]
                    @lines = []
                end

                 def parse(line)
                    @lines.append(line)
                end

                def to_string()
                    buffer = ""
                    buffer << sprintf("config timeserver '%s'\n", @name)
                    @lines.each do |line|
                        buffer << sprintf("%s\n", line)
                    end
                    return buffer
                end
            end



            ##### OpenWRT::Config::System

            attr_accessor :system
            attr_accessor :timeserver	            #string	    no	OpenWrt	The hostname for this system. Avoid points, even if they are within quotes. For example ' my.hostname ' will show only the ' my ' part

            def initialize(content: nil)
                @source_section_system = System_Block.new
                @source_section_timeserver = Timeserver_Block.new
                if content 
                    self.parse(content)
                end
            end

            def parse(source)
                section = {}
                source.split(/\r?\n|\r/) do |line|
                    section_break = System_Block::Pattern.match(line)
                    if section_break
                        section = @source_section_system
                        section.init(section_break)
                        next
                    end
                        
                    section_break = Timeserver_Block::Pattern.match(line)
                    if section_break
                        section = @source_section_timeserver
                        section.init(section_break)
                        next
                    end     
                  

                    if section.class.method_defined?(:parse)
                        section.parse(line)
                    else
                        #this does nothing because we are not in a known section
                    end
                end

                self.system = @source_section_system.clone
                self.timeserver = @source_section_timeserver.clone
            end

            def to_string()
                buffer = ""
                buffer << self.system.to_string()
                buffer << "\n"
                buffer << self.timeserver.to_string()
                return buffer
            end

        end
        class Network
            class Interface_Block
                Pattern = /config interface '(\w+)'/

                attr_accessor :name
                attr_accessor :option

                def initialize()
                    self.option = {}
                end

                def init(args)
                    self.name = args[1]
                end

                 def parse(line)                 
                    result = line.match(/\soption\s(\w+)\s'(.*?)'/)
                    if result
                        key = sprintf("%s",result[1])
                        value = sprintf("%s",result[2])
                        self.option[key] =value
                    end
                end

                def to_string()
                    buffer = ""
                    buffer << sprintf("config interface '%s'\n", self.name)
                    self.option.each do |key, value|
                        buffer << sprintf("\t option %s '%s'\n", key, value)
                    end
                    return buffer
                end
            end

            class Globals_Block
                Pattern = /config globals 'globals'/

                attr_accessor :option

                def initialize()
                    self.option = {}
                end

                def init(args)
                end

                 def parse(line)                 
                    result = line.match(/\soption\s(\w+)\s'(.*?)'/)
                    if result
                        key = sprintf("%s",result[1])
                        value = sprintf("%s",result[2])
                        self.option[key] =value
                    end
                end

                def to_string()
                    buffer = ""
                    buffer << sprintf("config globals '%s'\n", 'globals')
                    self.option.each do |key, value|
                        buffer << sprintf("\t option %s '%s'\n", key, value)
                    end
                    return buffer
                end
            end
            class Route_Block
                Pattern = /config route/

                attr_accessor :priority
                attr_accessor :option

                def initialize()
                    self.option = {}
                end

                def init(args)

                end

                 def parse(line)                 
                    result = line.match(/\soption\s(\w+)\s'(.*?)'/)
                    if result
                        key = sprintf("%s",result[1])
                        value = sprintf("%s",result[2])
                        self.option[key] =value
                    end
                end

                def matches(target: nil, interface: nil)
                    found = true
                    found = found & (self.option["target"] == target)
                    found = found & (self.option["interface"] == interface)
                    return found
                end

                def to_string()
                    buffer = ""
                    buffer << "config route\n"
                    self.option.each do |key, value|
                        buffer << sprintf("\t option %s '%s'\n", key, value)
                    end
                    return buffer
                end
                

            end


            ##### OpenWRT::Config::Network

            attr_accessor :interfaces
            attr_accessor :routes
            attr_accessor :global	            #string	    no	OpenWrt	The hostname for this system. Avoid points, even if they are within quotes. For example ' my.hostname ' will show only the ' my ' part

            def initialize(content: nil)
                self.interfaces = {}
                self.routes = []
                self.global = Globals_Block.new
                if content 
                    self.parse(content)
                end
            end            

            def parse(source)
                section = {}
                source.split(/\r?\n|\r/) do |line|                
                    section_break = Globals_Block::Pattern.match(line)
                    if section_break
                        section = self.global
                        section.init(section_break)
                        next
                    end
                        
                    section_break = Interface_Block::Pattern.match(line)
                    if section_break
                        section = Interface_Block.new()
                        section.init(section_break)
                        self.interfaces[section.name] = section
                        next
                    end     
                       
                    section_break = Route_Block::Pattern.match(line)
                    if section_break
                        section = Route_Block.new()
                        section.init(section_break)
                        self.routes.append(section)
                        next
                    end     

                    if section.class.method_defined?(:parse)
                        section.parse(line)
                    else
                        #this does nothing because we are not in a known section
                    end
                end
            end

            def to_string()
                buffer = ""
                buffer << self.global.to_string()
                buffer << "\n"
                self.interfaces.each do |key, value| 
                    buffer << value.to_string()
                    buffer << "\n"
                end
                self.routes.each do |item| 
                    buffer << item.to_string()
                    buffer << "\n"
                end
                return buffer
            end            
        end
    end
end