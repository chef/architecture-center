# Node Management - Canister Skills

## Labs 05 - Canister Skills and Services
This lab is going to explore how canister skills work, how they can be services, and how you can use this with your own custom skills.

### What you will do in this Lab
- Review the Courier Runner Canister Skill
- Register a new Canister Skill
- Add that skill to the workstation

#### Step 1: Review the Courier Runner skill registration
EXECUTE ```./step-1.sh```

> This command runs chef-node-management-cli management skill find-one-skill --skillName courier-runner | jq    

```json
{
  "item": {
    "canister": {
      "name": "courier-runner",
      "origin": "chef-platform",
      "service": true
    },
    "configurationTemplates": [ { ... } ],
    "dependencies": [],
    "name": "courier-runner",
    "native": null
  }
}
```
> A few things to note. See how this is a "service". Service cannisters are special cannisters that can only have one
> active version, and run under the Habitat Supervisor.    



#### Step 2: Review the Courier Runner skill registration
EXECUTE ```./step-2.sh```

> This script looks up the template and decodes it. It also looks up the skill settings and displays them.

**Configuration Templates**
```toml
[log]
dir = "{{.settings.log_dir}}"
format = "{{.settings.log_format}}"
level = "{{.settings.log_level}}"
output = "{{.settings.log_output}}"


[reporter]
name = "{{.settings.reporter_name}}"
internalInSec = {{.settings.reporter_interval_in_sec}}
retryIntervalInSec = {{.settings.reporter_retry_interval_in_sec}}
totalRetryDurationInMin = {{.settings.reporter_total_retry_duration_in_min}}
```

**Settings**
```json
{
  "name": "log_dir",
  "value": "/hab/svc/courier-runner/logs"
}
{
  "name": "log_format",
  "value": "json"
}
{
  "name": "log_level",
  "value": "debug"
}
{
  "name": "log_output",
  "value": "file"
}
{
  "name": "reporter_interval_in_sec",
  "value": "3"
}
{
  "name": "reporter_retry_interval_in_sec",
  "value": "4"
}
{
  "name": "reporter_total_retry_duration_in_min",
  "value": "2"
}
```

#### Step 3: Register a new canister 
EXECUTE ```./step-3.sh```

> This script runs chef-node-management-cli management skill create-skill


#### Step 4: Assign that skill to Workstation
EXECUTE ```./step-4.sh```

> This script runs chef-node-management-cli management assembly update-assembly 



#### Step 5: Verify skill installation
EXECUTE ```./step-5.sh```

> This waits to show when the skills are installed locally

#### Step 6: Run the installed Ansible Skill
EXECUTE ```./step-6.sh```

> This command executes the ansible skill to display it's version.
> hab pkg exec core/ansible ansible -- --version


