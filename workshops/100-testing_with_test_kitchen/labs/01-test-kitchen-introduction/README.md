# 100 Testing With Test Kitchen

## Videos

- [Lab Overview](../../seminar/videos/lab-01.mp4)

## Lab 01 - Introduction

This lab will provide the most basic introduction to Test Kitchen (w/ Dokken). For additional Test Kitchen documentation, please refer to [kitchen.ci](https://kitchen.ci/docs/).

### What You Will Do in This Lab

- Review the structure of the `kitchen.yml` file
- Create one Test Kitchen instance
- List the existing Test Kitchen instances
- Log in to a Test Kitchen instance
- Perform a converge
- Manually verify the converge
- Execute an InSpec verification
- Clean up

### Preparation: Open a Terminal

> You need to be in the `/home/ec2-user/workshop/best-practices/100-testing_with_test_kitchen/labs/01-test-kitchen-introduction` directory.

### Steps

#### Step 1: Review Current Running Containers and Loaded Images

EXECUTE: `./step-1.sh`  
> This script runs `docker ps -a` and `docker images` to list the current running state. If you have not run any other labs with Test Kitchen, this should result in no images and no containers.

#### Step 2: Prepare the Test Kitchen Environments

EXECUTE: `./step-2.sh`  
> This will prepare Test Kitchen by downloading the required containers.

#### Step 3: Review Current Running Containers and Loaded Images

EXECUTE: `./step-3.sh`  
> This will review what `kitchen create` did. You should see running containers and downloaded images.

#### Step 4: Log in to the Container (Verify No Git)

EXECUTE: `./step-4.sh`  
> This will log you into the test container that we will be running a converge on.

From the terminal:

1. `which git`  
   > This should result in the following message:  
   > `/usr/bin/which: no git in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin)`
2. `exit`  
   > This should return you to the OpenVSCode terminal.

#### Step 5: Converge

EXECUTE: `./step-5.sh`  
> This will execute the cookbook (that will install Git).

#### Step 6: Log in to the Container (Verify It Has Git)

EXECUTE: `./step-6.sh`  
> This will log you into the test container.

From the terminal:

1. `which git`  
   > This should result in the following message:  
   > `/usr/bin/git`
2. `exit`  
   > This should return you to the OpenVSCode terminal.

#### Step 7: InSpec Verify

EXECUTE: `./step-7.sh`  
> This will execute the InSpec test to verify Git is installed.  
> See `test/integration/default/default_test.rb`.

#### Step 8: Clean Up

EXECUTE: `./step-8.sh`  
> This runs a `test kitchen destroy` to clean up the environment. By default, the Test Kitchen Dokken driver will leave your environment running to allow rapid testing. It is important to destroy the environment before moving on to the next recipe/test/cookbook/policy.

#### Step 9: Verify the Environment

EXECUTE: `./step-9.sh`  
> This script runs `docker ps -a` and `docker images` to list the current running state. You should notice that your Test Kitchen instances have been cleaned up.
