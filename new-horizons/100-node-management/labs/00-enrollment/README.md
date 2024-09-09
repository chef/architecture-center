# Setting up the Node Management Lab(s)

## Labs 00 - enrollment
This lab will provide the step by step instructions to enroll the three primary linux nodes into Chef 360

### What you will do in this Lab
- Generate server side registration json files
- Register the linux nodes
- Review Registration Steps
- Verify skills are installed
- Register the Workstation (the Open VSCode Server)

#### Step 1: Generate the Enrollment Files
As every workshop contains unique SSH keys and a unique IP address range. In this step we will run a script that will generate some JSON files used to run server side enrollment.

EXECUTE ```./step-1.sh```

> This script will generate multiple JSON files, one for each node we will be enrolling.    
> Inside of that JSON file it contains a SSH key used for enrollment.     
> The script formats the key properly to be sent as part of a JSON payload.    
> The script also has to use the AWS API to discover the IP address of the VSCode workstation.   


#### Step 2: Enroll the 3 linux nodes
EXECUTE ```./step-2.sh```
> this script runs chef-node-management-cli enrollment enroll-node --body-file node-#.json.   
> Where the # is each of the nodes (1, 2, 3)     
> This queues the server side enrollment. In the next step we will check on the status of each of these actions

#### Step 3: Wait for enrollment to be completed
EXECUTE ```./step-3.sh```
> this script runs STATUS=$(chef-node-management-cli management node find-one-node --nodeId NODE_ID    
> Then the script uses ```jq``` to just pull out the single field we are looking for     
> Stay on this step until all nodes show 'enrolled'

#### Step 4: Inspecting the steps of enrollment
EXECUTE ```./step-4.sh```
> this script runs chef-node-management-cli status get-status --nodeId $NODE1        
> then the results are sent to ```jq``` to beautify the output

```JSON
{
  "item": {
    "id": "09f552af-9dc3-4c3e-97da-580a3530782d",
    "state": "Enrollment",
    "stateWorkflow": [
      {
        "log": "",
        "state": "Initialise",
        "status": "Success"
      },
      {
        "log": "",
        "state": "Dequeue",
        "status": "Success"
      },
      {
        "log": "",
        "state": "Enqueue",
        "status": "Success"
      },
      {
        "log": "",
        "state": "OS Identification",
        "status": "Success"
      },
      {
        "log": "",
        "state": "Remote Node Connection",
        "status": "Success"
      },
      {
        "log": "",
        "state": "HAB Installation",
        "status": "Success"
      },
      {
        "log": "",
        "state": "HAB Configuration",
        "status": "Success"
      },
      {
        "log": "",
        "state": "Agent Installation",
        "status": "Success"
      },
      {
        "log": "",
        "state": "Agent Configuration",
        "status": "Success"
      },
      {
        "log": "",
        "state": "Enrollment",
        "status": "Success"
      }
    ]
  }
}
```

#### Step 5: Verify skill installation
EXECUTE ```./step-5.sh```

> WARNING: this is a complicated script just intended to make sure everything is ready to go for the other labs    
> This script will load data about a node to verify the expected skills are installed     
> We will dive deeper into this in another lab


#### Step 6: Check Agent Installation
EXECUTE ```./step-6.sh```
> This will run hab pkg list chef-platform/node-management-agent    
> We expect this to return nothing


#### Step 7: Register VSCode
EXECUTE ```./step-7.sh```

> This will SSH into your VSCode machine and enroll it to node management 

#### Step 8: Verify Enrollment
EXECUTE ```./step-8.sh```

> this script runs STATUS=$(chef-node-management-cli management node find-one-node --nodeId NODE_ID    
> Then the script uses ```jq``` to just pull out the single field we are looking for     
> Stay on this step until all nodes show 'enrolled'

#### Step 9: Verify Agent Installation
EXECUTE ```./step-9.sh```

> This will run hab pkg list chef-platform/node-management-agent    
> We expect this to show us the node management agent
