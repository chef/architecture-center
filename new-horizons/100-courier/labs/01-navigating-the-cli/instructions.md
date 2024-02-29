
# Lab 01

## Navigating the Courer and Node Management CLI

>`WARNING` The CLI you will be using in this demo is not a fully featured CLI, it is a wrapper around various API Commands. It contains no data validation, no tab completion, and very limited help text. At beta courier will feature a fully realized API, including support for YAML, and data validation.  

## Table of Contents

- [Node Management - List Nodes](#list-nodes)
- [Node Management - Get Node](#get-node)
- [Node Management - Register Node](#register-node)
- [Courier Scheduler - List Jobs](#scheduler-list-jobs)
- [Courier Scheduler - Create Job](#scheduler-create-jobs)
- [Courier Scheduler - Get Job](#scheduler-get-job)
- [Courier Scheduler - Estimate Scheduler](#scheduler-estimate-schedule)
- [Courier State - List Jobs](#state-list-jobs)


## List Nodes

`node node list-nodes`

This command will list all of the nodes registered/enrolled with node management.

```
$ node node list-nodes
"076583f6-ade5-460a-b37e-482cb9c8f8c8"
"2b8a386b-41b5-4ec3-a9e8-9a7bf743dc1c"
"b3dda60a-430b-474b-80af-a3965e3afc52"
```

[^TOP^](#table-of-contents)




## Get Node
`node node get-node <UUID>`
This command will load a single node from node management and display the id and hostname (from all namespaces)

```
$ node node get-node 076583f6-ade5-460a-b37e-482cb9c8f8c8
{
  "id": "076583f6-ade5-460a-b37e-482cb9c8f8c8",
  "hostname": "ip-192-168-30-10.us-east-2.compute.internal"
}
```

`node node get-node <UUID> --json`

```
$ node node get-node 076583f6-ade5-460a-b37e-482cb9c8f8c8 --json
{
  "id": "076583f6-ade5-460a-b37e-482cb9c8f8c8",
  "settings_id": 1,
  "attributes": [
    {
      "name": "architecture",
      "value": "x86_64",
      "namespace": "agent"
    },
    {
      "name": "hostname",
      "value": "ip-192-168-30-10.us-east-2.compute.internal",
      "namespace": "agent"
    },
    {
      "name": "kernel_name",
      "value": "Linux",
      "namespace": "agent"
    },
    {
      "name": "kernel_version",
      "value": "6.1.66-93.164.amzn2023.x86_64",
      "namespace": "agent"
    },
    {
      "name": "time_zone",
      "value": "UTC+0000",
      "namespace": "agent"
    }
  ],
  "installed_skills": [],
  "required_skills": [],
  "checkedin_at": "2024-02-13T21:24:51.116985Z"
}
```

[^TOP^](#table-of-contents)





## Register Node

`node register <UUID>`
This command is unique to the Alpha and Private Preview versions of Chef Courier. This command will perform multiple operations, 1/ it will add the node to a node settings group, 2/ it will register the default skills

```
$ node register 076583f6-ade5-460a-b37e-482cb9c8f8c8

Error: you can not register the default nodes deployed with Courier Private Preview

$ node register <UUID>

Error: you can not register the default nodes deployed with Courier Private Preview

$ node register bbec24bf-0623-49d2-b040-2b43d9dfdb69
--- adding ---
{
  "name": "courier-runner",
  "canister": {
    "version": "1.0.61",
    "release": "20240129112444"
  }
}
{
  "name": "courier-runner",
  "canister": {
    "origin": "chef-platform",
    "name": "courier-runner",
    "version": "1.0.61",
    "release": "20240129112444"
  }
}
--- adding ---
{
  "name": "chef-gohai",
  "canister": {
    "version": "0.1.0",
    "release": "20240123161530"
  }
}
{
  "name": "chef-gohai",
  "canister": {
    "origin": "chef-platform",
    "name": "chef-gohai",
    "version": "0.1.0",
    "release": "20240123161530"
  }
}
--- adding ---
{
  "name": "shell-interpreter",
  "canister": {
    "version": "v0.1.1",
    "release": "20231222121103"
  }
}
{
  "name": "shell-interpreter",
  "canister": {
    "origin": "chef-platform",
    "name": "shell-interpreter",
    "version": "v0.1.1",
    "release": "20231222121103"
  }
}

```


[^TOP^](#table-of-contents)





## Scheduler List Jobs

`courier scheduler list-jobs`

```
$courier scheduler list-jobs

{"id":"0151118d-b2e4-4290-b0a3-b0efcf6c4b0b","name":"job1","executions":1,"immediate":true,"schedule":null}
{"id":"a3b24144-bf2b-47ae-8846-e8eeab6e8d41","name":"job2","executions":10,"immediate":false,"schedule":"RRULE:FREQ=MINUTELY;COUNT=10;INTERVAL=1"}
```

[^TOP^](#table-of-contents)







## Scheduler Get Job

`courier scheduler get-job <UUID>`

```
$ courier scheduler get-job cd40c5ba-1df2-4a65-a201-5798dae8fdf0

{
  "id": "cd40c5ba-1df2-4a65-a201-5798dae8fdf0",
  "name": "run_job_every_1_min_10_times",
  "targets": {
    "executionType": "sequential",
    "groups": [
      {
        "batchSize": {
          "type": "number",
          "value": 1
        },
        "distributionMethod": "batching",
        "nodeIdentifiers": [
          "2b8a386b-41b5-4ec3-a9e8-9a7bf743dc1c"
        ],
        "nodeListType": "nodes",
        "successCriteria": [
          {
            "numRuns": {
              "type": "percent",
              "value": 100
            },
            "status": "success"
          }
        ],
        "timeoutSeconds": 240
      }
    ]
  }
}
```

```
$ courier scheduler get-job cd40c5ba-1df2-4a65-a201-5798dae8fdf0 --json
{
  "ExecutionCount": 10,
  "JobOccurrenceExceptionReasons": [],
  "actions": {
    "accessMode": "agent",
    "steps": [
      {
        "command": [
          "date"
        ],
        "conditions": [],
        "expectedInputs": {},
        "failureBehavior": {
          "action": "retryThenFail",
          "retryBackoffStrategy": {
            "arguments": [],
            "delaySeconds": 0,
            "name": "none"
          }
        },
        "inputs": {},
        "interpreter": {
          "name": "chef-platform/shell-interpreter"
        },
        "limits": {},
        "outputFieldRules": null,
        "retryCount": 2,
        "stepNumber": 1
      }
    ]
  },
  "creationDateTime": "2024-02-12T22:16:36.985154522Z",
  "description": "demo the RRULE",
  "exceptionRules": [],
  "id": "cd40c5ba-1df2-4a65-a201-5798dae8fdf0",
  "immediate": false,
  "lastModifiedDateTime": "2024-02-12T22:16:36.985154522Z",
  "name": "run_job_every_1_min_10_times",
  "scheduleRule": "RRULE:FREQ=MINUTELY;COUNT=10;INTERVAL=1",
  "status": "active",
  "target": {
    "executionType": "sequential",
    "groups": [
      {
        "batchSize": {
          "type": "number",
          "value": 1
        },
        "distributionMethod": "batching",
        "nodeIdentifiers": [
          "2b8a386b-41b5-4ec3-a9e8-9a7bf743dc1c"
        ],
        "nodeListType": "nodes",
        "successCriteria": [
          {
            "numRuns": {
              "type": "percent",
              "value": 100
            },
            "status": "success"
          }
        ],
        "timeoutSeconds": 240
      }
    ]
  },
  "timeoutSeconds": 300
}
```

[^TOP^](#table-of-contents)






## Scheduler Create Jobs

`courier scheduler create-job <FILE>`

```
$courier scheduler create-job ./example-job.json

{"url":"http://localhost:8080/job/a69a6973-dfca-4d9b-bd51-8e42729132b8"}
```

[^TOP^](#table-of-contents)






## Scheduler Estimate Schedule

`courier scheduler estimate-schedule <UUID>`

```
$ courier scheduler estimate-schedule cd40c5ba-1df2-4a65-a201-5798dae8fdf0
{
  "blocked_by_exceptions": [],
  "estimates": [
    "2024-02-18T05:38:21Z",
    "2024-02-18T05:39:21Z",
    "2024-02-18T05:40:21Z",
    "2024-02-18T05:41:21Z",
    "2024-02-18T05:42:21Z",
    "2024-02-18T05:43:21Z",
    "2024-02-18T05:44:21Z",
    "2024-02-18T05:45:21Z",
    "2024-02-18T05:46:21Z"
  ]
}
```  





## State List Jobs

`courier state list-job-instances`

```
$ courier state list-job-instances

{"id":"af4c542d-1d51-4bbb-a28f-e9f1a3d72a19","job_id":"cd40c5ba-1df2-4a65-a201-5798dae8fdf0","status":"success","abandon_ct":0,"fail_ct":0,"success_ct":1}
{"id":"28dddcb8-957b-46aa-ae37-2ec01540c3ed","job_id":"b97f3999-b77f-4bbc-b206-96d6ee8dc900","status":"success","abandon_ct":1,"fail_ct":0,"success_ct":0}
{"id":"e572de34-829a-4305-a5c9-e8f5b2e5bd2c","job_id":"255a878d-d46f-4da2-8a20-0a0308a4674c","status":"success","abandon_ct":0,"fail_ct":0,"success_ct":3}
```


[^TOP^](#table-of-contents)


