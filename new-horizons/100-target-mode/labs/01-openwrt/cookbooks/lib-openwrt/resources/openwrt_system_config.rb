require 'OpenWRT' unless defined?(OpenWRT)
require 'TargetModeHelper' unless defined?(TargetModeHelper)

resource_name :openwrt_system_config 
provides :openwrt_system_config, target_mode: true#, platform: "linux"

property :hostname	            #string	    no	OpenWrt	The hostname for this system. Avoid points, even if they are within quotes. For example ' my.hostname ' will show only the ' my ' part
property :description	        #string	    no	(none)	A short, single-line description for this system. It should be suitable for human consumption in user interfaces, such as LuCI, selector UIs in remote administration applications, or remote UCI (over ubus RPC).
property :buffersize	        #integer	no	kernel specific	Size of the kernel message buffer.
property :conloglevel	        #integer	no	7	Number between 1-8. The maximum log level for kernel messages to be logged to the console. Only messages with a level lower than this will be printed to the console. Higher level messages have lower log level number. Highest level messages are ones with log level 0. If you want more verbose messages in console put conloglevel to 8 if you want less messages lower conloglevel to 4 or even less. This option and similar parameters may not be effective since 17.x and later.
property :cronloglevel	        #integer	no	5	The minimum level for cron messages to be logged to syslog. 0 will print all debug messages, 8 will log command executions, and 9 or higher will only log error messages.
property :klogconloglevel	    #integer	no	7	The maximum log level for kernel messages to be logged to the console. Only messages with a level lower than this will be printed to the console. Identical to conloglevel and will override it.
property :log_buffer_size	    #integer	no	(none)	Size of the log buffer of the procd based system log, that is accessible via the logread command. Defaults to the value of log_size if unset.
property :log_file	            #string	    no	no log file	File to write log messages to (type file). The default is to not write a log in a file. The most often used location for a system log file is /var/log/messages.
property :log_hostname	        #string	    no	(none)	Hostname to send to remote syslog. If none is provided, the actual hostname is send. This feature is only present in 17.xx and later versions
property :log_ip	            #IP address	no	(none)	IP address of a syslog server to which the log messages should be sent in addition to the local destination.
property :log_port	            #integer	no	514	Port number of the remote syslog server specified with log_ip.
property :log_prefix	        #string	    no	(none)	Adds a prefix to all log messages send over network.
property :log_proto	            #string	    no	udp	Sets the protocol to use for the connection, either tcp or udp.
property :log_remote	        #bool	    no	1	Enables remote logging.
property :log_size	            #integer	no	64	Size of the file based log buffer in KiB (see log_file). This value is used as the fallback value for log_buffer_size if the latter is not specified.
property :log_trailer_null	    #bool	    no	0	Use \0 instead of \n as trailer when using TCP.
property :log_type	            #string	    no	circular	Either circular or file. The circular option is a fixed size queue in memory, while the file is a dynamically sized file, that can be in memory, or written to disk. Note: If log_type is set to file, then at some point when the log fills, the device may encounter an out-of-space condition. This is especially an issue for devices with limited onboard storage: in memory, or on flash.
property :ttylogin	            #bool	    no	0	Require authentication for local users to log in the system. Disabled by default. It applies to the access methods listed in /etc/inittab, such as keyboard and serial.
property :urandom_seed	        #string	    no	0	Path of the seed. Enables saving a new seed on each boot.
property :timezone	            #string	    no	UTC	POSIX.1 time zone string corresponding to the time zone in which date and time should be displayed by default. See timezone database for a mapping between IANA/Olson and POSIX.1 formats. (For London this corresponds to GMT0BST,M3.5.0/1,M10.5.0)
property :zonename	            #string	    no	UTC	IANA/Olson time zone string. If zoneinfo-* packages are present, possible values can be found by running find /usr/share/zoneinfo. See timezone database for a mapping between IANA/Olson and POSIX.1 formats. (For London this corresponds to Europe/London)
property :zram_comp_algo	    #string	    no	lzo	Compression algorithm to use for ZRAM, can be one of lzo, lzo-rle, lz4, zstd
property :zram_size_mb	        #integer	no	Ramsize in kB divided by 2048	Size of ZRAM in MB
property :reboot	            #integer	no	Ramsize in kB divided by 2048	Size of ZRAM in MB


# Load the current value for content and mode
load_current_value do |new_resource|
    backend = TargetModeHelper.new(__transport_connection)
    src = backend.read_text_file("/etc/config/system")
    cfg = OpenWRT::Config::System.new
    cfg.parse(src)

    hostname cfg.system.hostname
    description cfg.system.description
    buffersize cfg.system.buffersize
    conloglevel cfg.system.conloglevel
    cronloglevel cfg.system.cronloglevel
    klogconloglevel cfg.system.klogconloglevel
    log_buffer_size cfg.system.log_buffer_size
    log_file cfg.system.log_file
    log_hostname cfg.system.log_hostname
    log_ip cfg.system.log_ip
    log_port cfg.system.log_port
    log_prefix cfg.system.log_prefix
    log_proto cfg.system.log_proto
    log_remote cfg.system.log_remote
    log_size cfg.system.log_size
    log_trailer_null cfg.system.log_trailer_null
    log_type cfg.system.log_type
    ttylogin cfg.system.ttylogin
    urandom_seed cfg.system.urandom_seed
    timezone cfg.system.timezone
    zonename cfg.system.zonename
    zram_comp_algo cfg.system.zram_comp_algo
    zram_size_mb cfg.system.zram_size_mb
end

action :create do

    converge_if_changed do
        backend = TargetModeHelper.new(__transport_connection)
        src = backend.read_text_file("/etc/config/system")
        cfg = OpenWRT::Config::System.new(content: src)

        cfg.system.hostname         = new_resource.hostname             if property_is_set?(:hostname)
        cfg.system.description      = new_resource.description          if property_is_set?(:description)
        cfg.system.buffersize       = new_resource.buffersize           if property_is_set?(:buffersize)
        cfg.system.conloglevel      = new_resource.conloglevel          if property_is_set?(:conloglevel)
        cfg.system.cronloglevel     = new_resource.cronloglevel         if property_is_set?(:cronloglevel)
        cfg.system.klogconloglevel  = new_resource.klogconloglevel      if property_is_set?(:klogconloglevel)
        cfg.system.log_buffer_size  = new_resource.log_buffer_size      if property_is_set?(:log_buffer_size)
        cfg.system.log_file         = new_resource.log_file             if property_is_set?(:log_file)
        cfg.system.log_hostname     = new_resource.log_hostname         if property_is_set?(:log_hostname)
        cfg.system.log_ip           = new_resource.log_ip               if property_is_set?(:log_ip)
        cfg.system.log_port         = new_resource.log_port             if property_is_set?(:log_port)
        cfg.system.log_prefix       = new_resource.log_prefix           if property_is_set?(:log_prefix)
        cfg.system.log_proto        = new_resource.log_proto            if property_is_set?(:log_proto)
        cfg.system.log_remote       = new_resource.log_remote           if property_is_set?(:log_remote)
        cfg.system.log_size         = new_resource.log_size             if property_is_set?(:log_size)
        cfg.system.log_trailer_null = new_resource.log_trailer_null     if property_is_set?(:log_trailer_null)
        cfg.system.log_type         = new_resource.log_type             if property_is_set?(:log_type)
        cfg.system.ttylogin         = new_resource.ttylogin             if property_is_set?(:ttylogin)
        cfg.system.urandom_seed     = new_resource.urandom_seed         if property_is_set?(:urandom_seed)
        cfg.system.timezone         = new_resource.timezone             if property_is_set?(:timezone)
        cfg.system.zonename         = new_resource.zonename             if property_is_set?(:zonename)
        cfg.system.zram_comp_algo   = new_resource.zram_comp_algo       if property_is_set?(:zram_comp_algo)
        cfg.system.zram_size_mb     = new_resource.zram_size_mb         if property_is_set?(:zram_size_mb)
       
        backend.write_text_file("/etc/config/system", cfg.to_string())
    end
end