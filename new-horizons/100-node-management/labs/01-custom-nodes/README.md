# Node Management - Your Fleet Inventory

## Labs 01 - custom nodes
This lab is going to explore node management as an inventory of your fleet, and how you can add un-managed nodes into the fleet

### What you will do in this Lab
- View the current fleet
- Register the OpenWRT unmanaged node
- Apply a tag to OpenWRT
- Populate the attributes

#### Step 1: View the current fleet
EXECUTE ```./step-1.sh```

> This step runs chef-node-management-cli management node find-all-nodes  and formats the results so we can see just the four (4) nodes we have in inventory    
> **HINT:** this workshop was designed so the first letter of the UUID indicates what node it is
> - 0 = one of the linux nodes
> - c = OpenVSCode

#### Step 2: Register the OpenWRT node
EXECUTE ```./step-2.sh```

> This step will chef-node-management-cli management node create-node to create a new node    


#### Step 3: View the node
EXECUTE ```./step-3.sh```

> This step will run chef-node-management-cli management node find-one-node --nodeId $WRT and format the results       
> There are a few things to node specificly the enrollmentLevel of "inducted"

```json
{
  "item": {
    "attributes": [],
    "checkedinAt": "2024-09-08T15:25:20.468919Z",
    "cohortId": "a494d057-5bda-4466-841e-cf72fb753943",
    "enrollmentLevel": "inducted",
    "healthStatus": "ready",
    "id": "ff0a4e6c-fa05-4ccd-8f59-758cf21339a5",
    "installedSkills": [],
    "requiredSkills": []
  }
}
```

#### Step 4: Apply a tag
EXECUTE ```./step-4.sh```



#### Step 5: View the node
EXECUTE ```./step-5.sh```

> This step will run chef-node-management-cli management node find-one-node --nodeId $WRT and format the results       
> We can now see a new attribute with the namespace tags. Here we have identifiy the name of the node.    
> Tags is a reserved namespace and can only be applied with the tags command/api

```json
{
  "item": {
    "attributes": [
      {
        "name": "name",
        "namespace": "tags",
        "value": "OpenWRT"
      }
    ],
    ...
  }
}
```

#### Step 6: Verify ohai and Target Mode credentials 
EXECUTE ```./step-6.sh```

> Note if this step does not work please configure the level 100 target mode workshop or create the proper .chef/credentials file.    
> You should see the text "All Required items exist"


#### Step 7: Run Ohai (targeted) and Add to inventory
EXECUTE ```./step-7.sh```

> Warning: the JQ in this script is a bit more complicated than the others, that is to extract specific results.    
> This script is intended to help simulate integration using the CLI and represent how discovery works

What just Happened?
1. Ohai was run using chef-agentless (target mode) 
2. Specific attributes were extract from the Ohai findings
3. the Node Management CLI was used to update the attributes (in the ohai namespace)

#### Step 8: View the node
EXECUTE ```./step-8.sh```

> This step will run chef-node-management-cli management node find-one-node --nodeId $WRT and format the results       
> We can now see a new attribute with the namespace ohai. Here we have identifiy the name of the node.    
> Tags is a reserved namespace and can only be applied with the tags command/api

```json
{
  "item": {
    "attributes": [
      {
        "name": "arch",
        "namespace": "ohai",
        "value": "x86_64"
      },
      {
        "name": "fips",
        "namespace": "ohai",
        "value": "false"
      },
      {
        "name": "kernel",
        "namespace": "ohai",
        "value": "linux"
      },
      {
        "name": "manufacturer",
        "namespace": "ohai",
        "value": "OpenWrt"
      },
      {
        "name": "os",
        "namespace": "ohai",
        "value": "OpenWrt 22.03.5"
      },
      {
        "name": "platform",
        "namespace": "ohai",
        "value": "openwrt"
      },
      {
        "name": "product_line",
        "namespace": "ohai",
        "value": "Generic"
      },
      {
        "name": "release",
        "namespace": "ohai",
        "value": "OpenWrt 22.03.5 r20134-5f15225c1e"
      },
      {
        "name": "timezone",
        "namespace": "ohai",
        "value": "UTC"
      },
      {
        "name": "version",
        "namespace": "ohai",
        "value": "22.03.5"
      },
      ...
    ],
    ...
  }
}
```
