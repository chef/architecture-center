# 100 Testing With Test Kitchen

## Labs 01 - introduction
This lab will provide the most basic introduction to test kitchen (w/ dokken). For additional test kitchen documentation please refer to [kitchen.ci](https://kitchen.ci/docs/)

### What you will do in this Lab
- Review the structure of the Kitchen.yml file
- Create one Test Kitchen instances
- List the existing Test Kitchen instances
- Login to a test kitchen instance
- Perform a converage
- Manually verify the converage
- Execute an InSpec verification
- Clean up

_Preperation: Open a Terminal_      
> You need to be in the /home/ec2-user/workshop/best-practices/100-testing_with_test_kitchen/labs/01-test-kitchen-introduction directory

#### Step 1: Review current running containers and loaded images.      
EXECUTE ```./step-1.sh```
> This script runs ```docker ps -a``` and ```docker images``` to list the current running state. If you have not run any other labs with test kitchen this should result in no images and no containers.


#### Step 2: Prepare the Test Kitchen enviornments      
EXECUTE: ```./step-2.sh```      
> This will prepare Test Kitchen by downloading the required containers.


#### Step 3: Review current running containers and loaded images.      
EXECUTE: ```./step-3.sh```      
> This will review what kitchen create did. You should see running containers and downloaded images.


#### Step 4: Login to the container (verify no git).      
EXECUTE: ```./step-4.sh```      
> This will log you into the test container that we will be running a converage on.

From the terminal:
1. ```which git```
> this should result in the following message:     
> "/usr/bin/which: no git in (/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/bin)"
1. ```exit```
> this should return you to the OpenVSCode terminal

#### Step 5: Converage.      
EXECUTE: ```./step-5.sh```      
> This will execute the cookbook (that will install git)

#### Step 6: Login to the container (verify it has git).      
EXECUTE: ```./step-6.sh```      
> This will log you into the test container.

From the terminal:
1. ```which git```
> this should result in the following message:     
> "/usr/bin/git"
1. ```exit```
> this should return you to the OpenVSCode terminal

#### Step 7: InSpec verify.      
EXECUTE: ```./step-7.sh```      
> This will execute the InSpec test to verify git is installed     
> see (test/integration/default/default_test.rb)

#### Step 8: Clean up.      
EXECUTE: ```./step-8.sh```      
> This run a test kitchen destroy to cleanup the environment. By default the Test Kitchen Dokken driver will leave your environment running to allow rappid testing. It is important to destroy the environment before moving on to the next recipie/test/cookbook/policy.

#### Step 9: Verify the enviornment.      
EXECUTE ```./step-9.sh```
> This script runs ```docker ps -a``` and ```docker images``` to list the current running state. You should notice that your test kitchen instances have been cleaned up.
