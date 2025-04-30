# Node Management - Native Skills

## Labs 05 - Native Skills
This lab is going to explore how native skills can be used to detect installed software

### What you will do in this Lab
- Add two (2) native skills
- Review the installed skills


#### Step 1: Install AWS Native Skill
EXECUTE ```./step-1.sh```

> This command runs chef-node-management-cli management skill create-skill     

```json
{
    "name": "aws-cli",
    "native": {
        "versionCommand": "aws --version"
    }
}
```

> We can see from the above skil defination to add a native skill you only need to indicate how to detect the version (using a version command)


#### Step 2: Install Docker Native Skill
EXECUTE ```./step-2.sh```

```json
{
    "name": "docker",
    "native": {
        "versionCommand": "docker -v"
    }
}
```


#### Step 3: Waiting for Skills to be Detected
EXECUTE ```./step-3.sh```

> This script will load data about a node to verify the expected skills from the assembly are installed    


#### Step 4: Inspecting all Skills on the Workstation node
EXECUTE ```./step-4.sh```

> This script executes chef-node-management-cli management node find-one-node --nodeId $VSCODE     
> It then displays the installed skills section
