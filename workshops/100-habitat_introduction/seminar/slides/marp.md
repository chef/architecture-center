---
marp: true
#theme: uncover
#theme: default
#theme: gaia
#class:
#  - lead

paginate: true
header: '![w:200px](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/header-logo.png)'
footer: '&copy; 2024 Progress Software Corporation and/or its subsidiaries or affiliates. All rights reserved.'
size: 16:9
style: |
  footer {
    font-size: 10px;
  }
  .columns-2 {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 1rem;
  }
  .small li {
    font-size: 70%;
  }
  .columns-3 {
    display: grid;
    grid-template-columns: repeat(3, minmax(0, 1fr));
    gap: 1rem;
  }

title: Introduction to Chef Habitat
description: Workshop Series - level 100. Introduction to Habitat
author: George Westwater, Progress Chef
url: https://github.com/chef/architecture-center/blob/main/new-horizons/100-target-mode/seminar/slides/marp.md
#image: https://marp.app/og-image.jpg
---

# Chef Habitat
## Introduction to Habitat
### Workshop - level 100
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/logo.png)



---
![bg right](https://get.pxhere.com/photo/landscape-tree-nature-forest-wilderness-plant-shore-flower-lake-river-summer-pond-pine-savanna-vegetation-wetland-reeds-habitat-ecosystem-natural-environment-woody-plant-1112797.jpg)
<!-- _paginate: "false" -->
<!-- image source: "https://get.pxhere.com/photo/landscape-tree-nature-forest-wilderness-plant-shore-flower-lake-river-summer-pond-pine-savanna-vegetation-wetland-reeds-habitat-ecosystem-natural-environment-woody-plant-1112797.jpg" -->
# What is Habitat?

---
<!-- _paginate: "false" -->
![bg right:58% w:100%](images/pillars.png)

## Five Pillars of DevOps
- Security/Compliance
- Infrastructure 
- Node Management 
- Orchestration
- Application Delivery

---
<!-- _paginate: "false" -->
![bg left](https://get.pxhere.com/photo/hand-finger-arm-strategy-connect-organ-jigsaw-thumb-puzzle-pieces-business-solutions-547742.jpg)

## Components 
- Package Manager
- Packaging System 
- Build System 
- Deployment System 
- Service Supervisor
- Service Clustering

---
<!-- _paginate: "false" -->
![bg w:90%](images/anatomy.png)

---
<!-- _paginate: "false" -->
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/right-blue-1.png)

## Package Manager

Habitat is a lightweight package manager, that uniquely allows multiple versions of a package to coexist on the same system.

---
<!-- _paginate: "false" -->
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/right-blue-1.png)

## Package System

Habitat Artifacts are immutable signed bundles that contain the build instructions, configuration instructions, and runtime settings.


---
<!-- _paginate: "false" -->
![bg w:80% right](images/plan.png)

## Build System (Plan)

Plans instruct Chef Habitat on how to build, deploy, and manage your application.

Artifacts may also include application lifecycle hooks and service configuration files describing the running service’s configuration and behavior.

---
<!-- _paginate: "false" -->
![bg width:90%](images/build.png)

---
<!-- _paginate: "false" -->
## Deployment System 

![](./images/deploy.png)

---
<!-- _paginate: "false" -->
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/left-green-1.png)

## Service Supervisor     
     
         
The supervisor is a lightweight process manager.

- systemd
- upstart
- openrc
- sysvinit
- runit
- nssm
- srvstart


---
<!-- _paginate: "false" -->
![bg w:90%](images/ring.png)

