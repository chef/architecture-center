# Enrolling Nodes into Node Management

## Labs 01 - Enrolling Nodes
This lab will provide the step by step instructions to enroll Nodes for the courier workshop

### What you will do in this Lab
- Enroll Node Management on three (3) nodes
- Register three (3) nodes with the default Node Management cohort
- Have Node Management install Courier Runner & the OS interpreter 

#### Step 1: Connect each node
1. In the lower left execute ```~/workshop/new-horizons/100-courier/labs/00-configuration/enroll-1.sh```
1. In the lower center execute ```~/workshop/new-horizons/100-courier/labs/00-configuration/enroll-2.sh```
1. In the lower right execute ```~/workshop/new-horizons/100-courier/labs/00-configuration/enroll-3.sh```    
> These commands will follow the journal during enrollment

1. In the uppoer right execute ```watch node node list-nodes```
> This command will poll every 2 seconds to wait for node management to have the new nodes enrolled   
> WARNING: these results are not in order and may change every few seconds

#### Step 2: Enroll to ndoe management
In the upper left execute
1. ```~/nodes/enroll.sh```
2. wait for the upper right screen to show three unique Node ID's (UUIDs)
1. In the upper right press ```Control c``` to cancel the watch
1. In the upper right execute ```node node list-nodes```

#### Step 3: Register To Node Management
With each UUID (from the uppor right) run the following command (in the upper left)
- ```node register <UUID>```

to ensure all nodes are registerd with skills in the upper left type
```node node list-nodes --json```

#### Step 4: Finalization
1. In the lower left press ```Control c``` to cancel the watch
1. In the lower left execute ```~/workshop/new-horizons/100-courier/labs/00-configuration/courier-1.sh```
1. In the lower center press ```Control c``` to cancel the watch
1. In the lower center execute ```~/workshop/new-horizons/100-courier/labs/00-configuration/courier-2.sh```
1. In the lower right press ```Control c``` to cancel the watch
1. In the lower right execute ```~/workshop/new-horizons/100-courier/labs/00-configuration/courier-3.sh```    
1. In the upper right hand corner press ```Control c``` to cancel the watch.
1. in the upper right type ```watch --interval 1 courier state list-job-instances```