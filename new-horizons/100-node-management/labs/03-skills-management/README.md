# Node Management - Skills Management

## Labs 03 - Skills
This lab is going to explore How to manage skills on node

### What you will do in this Lab
- Add a Chef Client and InSpec to the worker nodes
- Add multiple skills to VSCode
- Remove a Skill
- Prohibit a Skill


#### Step 1: Looking at a Skill Assembly
EXECUTE ```./step-1.sh```


> This step will output the skill assembly assigned to the worker nodes. Skill assemblies are the rules used to    
> know what skills should be installed on a node

```json
{
  "item": {
    "id": "47b32704-6cc7-4bbd-978a-646984e9658b",
    "name": "node-skills",
    "skills": [
      {
        "action": "add",
        "skill": {
          "channel": "stable",
          "name": "chef-client-interpreter",
          "value": [
            "1.0.3"
          ]
        }
      },
      ...
    ]
  }
}
```

#### Step 2: Add Chef and InSpec to the Skill Assembly
EXECUTE ```./step-2.sh```

> The script is running chef-node-management-cli management assembly update-assembly

```yaml
---
skills:
- action: add
  skill:
    channel: stable
    name: chef-infra-client
    value:
    - 18.5.0
- action: add
  skill:
    channel: stable
    name: inspec
    value:
    - 5.22.58
- ...
```

#### Step 3: Waiting for Skills to be Installed
EXECUTE ```./step-3.sh```
> This script will load data about a node to verify the expected skills from the assembly are installed    


#### Step 4: Inspecting the Skills
EXECUTE ```./step-4.sh```

> This script executes chef-node-management-cli management node find-one-node --nodeId $NODE1     
> It then displays the installed skills section


#### Step 5: Add Multiple versions of Chef to VSCode
EXECUTE ```./step-5.sh```


#### Step 6: Waiting for Skills to be Installed
EXECUTE ```./step-6.sh```

hab pkg list chef/chef-infra-client

#### Step 7: Remove One of the Chef Versions from VSCode
EXECUTE ```./step-7.sh```

> In this example the version of infra client was removed from the version from "add" rule, leaving only 18.5.0.    
> We then add or "prohibit" anything below Chef Client 18 being on the machine using a remove rule.    

```yaml
---
skills:
- action: add
  skill:
    channel: stable
    name: chef-infra-client
    value:
    - 18.5.0
- action: remove
  skill:
    channel: stable
    name: chef-infra-client
    value:
    - < 18
```

#### Step 8: Waiting for Skills to be Removed
EXECUTE ```./step-8.sh```


#### Step 9: Manually install the Forbidden skill
EXECUTE ```./step-9.sh```


#### Step 10: Wait for sync
EXECUTE ```./step-10.sh```

