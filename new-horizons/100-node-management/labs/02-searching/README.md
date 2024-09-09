# Node Management - Searching Inventory

## Labs 02 - Searching
This lab is going to explore a few ways to search and manage your inventory

### What you will do in this Lab
- Run an adhoc query by attribute
- Run an adhoc query by skill
- Save a Query
- Create a List

#### Step 1: Search for all Linux Nodes
EXECUTE ```./step-1.sh```

> This step runs cchef-node-management-cli management filter run-adhocFilter and formats the results.    
> NOTE: this is also an example of using a YAML payload instead of a JSON
> **HINT:** this workshop was designed so the first letter of the UUID indicates what node it is
> - 0 = one of the linux nodes
> - c = OpenVSCode
> - f = OpenWRT

```yaml
---
constraints:
  attributes:
  - name: kernel_name
    operator: "="
    value:
    - Linux
```

> Note in this example we did not include a namespace in the search so we also got the OpenWRT instance


#### Step 2: Limit the search to the agent namespace
EXECUTE ```./step-2.sh```

```yaml
---
constraints:
  attributes:
  - name: kernel_name
    namespace: agent
    operator: "="
    value:
    - Linux
```

#### Step 3: Looking at all attributes for Node 1
EXECUTE ```./step-3.sh```

> This command runs the chef-node-management-cli management node find-one-node --nodeId $NODE1    
> and then uses JQ to just show the attributes for the node.

**Namespace:** agent
```json
[
  {
    "name": "architecture",
    "namespace": "agent",
    "value": "x86_64"
  },
  {
    "name": "hostname",
    "namespace": "agent",
    "value": "ip-192-168-10-10.ec2.internal"
  },
  {
    "name": "kernel_name",
    "namespace": "agent",
    "value": "Linux"
  },
  {
    "name": "kernel_version",
    "namespace": "agent",
    "value": "6.1.106-116.188.amzn2023.x86_64"
  },
  {
    "name": "netmask",
    "namespace": "agent",
    "value": "255.255.255.0"
  },
  {
    "name": "os_name",
    "namespace": "agent",
    "value": "Amazon Linux"
  },
  {
    "name": "os_version",
    "namespace": "agent",
    "value": "2023"
  },
  {
    "name": "primary_ip",
    "namespace": "agent",
    "value": "192.168.10.10"
  },
  {
    "name": "time_zone",
    "namespace": "agent",
    "value": "UTC+0000"
  }.
  ...
]
```

**Namespace:** aws
```json
[
  ...,
  {
    "name": "account-id",
    "namespace": "aws",
    "value": "834902008322"
  },
  {
    "name": "ami-id",
    "namespace": "aws",
    "value": "ami-0182f373e66f89c85"
  },
  {
    "name": "architecture",
    "namespace": "aws",
    "value": "x86_64"
  },
  {
    "name": "availability-zone",
    "namespace": "aws",
    "value": "us-east-1a"
  },
  {
    "name": "hostname",
    "namespace": "aws",
    "value": "ip-192-168-10-10.ec2.internal"
  },
  {
    "name": "instance-id",
    "namespace": "aws",
    "value": "i-0b0288a7986eed976"
  },
  {
    "name": "instance-type",
    "namespace": "aws",
    "value": "t3.micro"
  },
  {
    "name": "local-hostname",
    "namespace": "aws",
    "value": "ip-192-168-10-10.ec2.internal"
  },
  {
    "name": "local-ipv4",
    "namespace": "aws",
    "value": "192.168.10.10"
  },
  {
    "name": "mac",
    "namespace": "aws",
    "value": "02:c8:31:61:7b:bb"
  },
  {
    "name": "private-ip",
    "namespace": "aws",
    "value": "192.168.10.10"
  },
  {
    "name": "region",
    "namespace": "aws",
    "value": "us-east-1"
  },
  ...
]
```

**Namespace:** enroll

```json
[
  ...,
  {
    "name": "fqdn",
    "namespace": "enroll",
    "value": "192.168.10.10"
  },
  ...
]

**Namespace:** gohai
```json
[
  ...,
  {
    "name": "cpu_cores",
    "namespace": "gohai",
    "value": "1"
  },
  {
    "name": "cpu_family",
    "namespace": "gohai",
    "value": "6"
  },
  {
    "name": "cpu_logical_processors",
    "namespace": "gohai",
    "value": "2"
  },
  {
    "name": "cpu_mhz",
    "namespace": "gohai",
    "value": "2499.996"
  },
  {
    "name": "cpu_model",
    "namespace": "gohai",
    "value": "85"
  },
  {
    "name": "cpu_modelname",
    "namespace": "gohai",
    "value": "Intel(R) Xeon(R) Platinum 8259CL CPU @ 2.50GHz"
  },
  {
    "name": "cpu_stepping",
    "namespace": "gohai",
    "value": "7"
  },
  {
    "name": "hostname",
    "namespace": "gohai",
    "value": "ip-192-168-10-10.ec2.internal"
  },
  {
    "name": "instance_type",
    "namespace": "gohai",
    "value": "aws"
  },
  {
    "name": "ipaddress",
    "namespace": "gohai",
    "value": "192.168.10.10"
  },
  {
    "name": "ipaddress_v6",
    "namespace": "gohai",
    "value": "fe80::c8:31ff:fe61:7bbb"
  },
  {
    "name": "kernel_name",
    "namespace": "gohai",
    "value": "Linux"
  },
  {
    "name": "kernel_release_date",
    "namespace": "gohai",
    "value": "#1 SMP PREEMPT_DYNAMIC Tue Aug 27 07:00:36 UTC 2024"
  },
  {
    "name": "kernel_version",
    "namespace": "gohai",
    "value": "6.1.106-116.188.amzn2023.x86_64"
  },
  {
    "name": "macaddress",
    "namespace": "gohai",
    "value": "02:c8:31:61:7b:bb"
  },
  {
    "name": "machine_architecture",
    "namespace": "gohai",
    "value": "x86_64"
  },
  {
    "name": "os",
    "namespace": "gohai",
    "value": "GNU/Linux"
  },
  {
    "name": "processor_type",
    "namespace": "gohai",
    "value": "x86_64"
  },
  {
    "name": "total_memory_inbytes",
    "namespace": "gohai",
    "value": "948940800"
  },
  {
    "name": "total_swapmemory",
    "namespace": "gohai",
    "value": "0kB"
  },
  {
    "name": "vendor_id",
    "namespace": "gohai",
    "value": "GenuineIntel"
  }
]
```


#### Step 4: A more interesting query
EXECUTE ```./step-4.sh```

> This step runs cchef-node-management-cli management filter run-adhocFilter and formats the results.    

```yaml
---
constraints:
  attributes:
  - name: kernel_name
    namespace: "agent",
    operator: "="
    value:
    - Linux
  - name: instance-type
    namespace: aws
    operator: "="
    value:
    - t3.micro
    - t3.small
  - name: instance-type
    namespace: aws
    operator: "="
    value:
    - t3.micro
    - t3.small
  - name: ipaddress
    namespace: gohai
    operator: "MATCHES"
    value:
    - "^192\\.168\\.10\\.(20|30)"
```




#### Step 5: Filtering by skills
EXECUTE ```./step-5.sh```

> This step runs cchef-node-management-cli management filter run-adhocFilter and formats the results.    

```yaml
---
constraints:
  attributes:
  - name: kernel_name
    namespace: "agent"
    operator: "="
    value:
    - Linux
  skills:
  - name: courier-runner
    version:
    - "= 1.4.2"
```

#### Step 6: Saving a query
EXECUTE ```./step-6.sh```

> This step runs chef-node-management-cli management filter create-filter --body-file step-6.sh.json     
> Note, this step uses json instead of YAML if interested open the two and compare the difference between saving a filter and an adhoc filter


#### Step 7: Run the Saved Query
EXECUTE ```./step-7.sh```

> this command runs chef-node-management-cli management filter run-savedFilter     
> **Note 1:** this script first finds the filter we just created, this is just so you do not need to copy and paste the ID 
> **Note 2:** this script only outputs the total pages not the details of the results to ensure it fits well on the screen


#### Step 8: Create a Static List
EXECUTE ```./step-8.sh```

> This step runs chef-node-management-cli management list create-list     
> Note, step dynamicly creates the payload to ensure we know which node id's are being used

```json
{
  "name": "worker-nodes",
  "nodeIds": [
    "09f552af-9dc3-4c3e-97da-580a3530782d",
    "0a379eb0-3faa-4da0-86b0-91823b420ed6",
    "0566f638-3136-4798-be54-e7d063a0e3a6"
  ]
}
```

#### Step 9: Run the Static List
EXECUTE ```./step-9.sh```

> this command runs management list find-one-list     
> by default lists do not "expand" to include details as we can see from the results    
> **Note 1:** this script first finds the list we just created, this is just so you do not need to copy and paste the ID 


#### Step 10: Expand the Static List
EXECUTE ```./step-10.sh```

> this command runs management list find-one-list --expand true