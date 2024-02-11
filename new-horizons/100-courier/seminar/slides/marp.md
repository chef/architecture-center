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

title: Introduction to Chef Courier
description: New Horizons Series - level 100. Introduction to Chef Courier
author: George Westwater, Progress Chef
url: https://github.com/chef/architecture-center/blob/main/new-horizons/100-courier/seminar/slides/marp.md
#image: https://marp.app/og-image.jpg
---

# Chef Courier
## Introduction to Chef Courier
### New Horizons - level 100
#### What and Why
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/logo.png)

---
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/right-blue-1.png)
<!-- _paginate: "false" -->
# What is Courier?

<!--
Courier is a powerful Job Orchistration component of Chef Platform. 

Job orchestration is about creating and managing workflows that automate a sequence of tasks across multiple systems. This process is crucial for managing complex IT environments, where it's necessary to synchronize and streamline operations across different platforms and tools​​.

Job orchestration streamlines and optimizes frequently occurring workflows, or enables infrequent worklows to be exeuted on-demand. It plays a crucial role in improving the efficiency of IT processes such as server provisioning, incident management, and incident response.

Courier provides the ability to rapidly integrate new tools and technologies, develop and iterate end-to-end processes, and standardize and maintain permissions, auditing, and business rules across various environments. Courier also offers a unified view for monitoring processes, infrastructure, and systems from a single location​​.
-->
---
## Purpose
Provide user the ability to execute and verify any action (_**however**_) on any set/subset of nodes (_**wherever**_), at any time interval (_**whenever**_) including immediately, subsequently, or at periodic intervals. 

---
<!-- _header: "" -->
![bg left](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/left-blue-1.png)
## Courier for:
- DevOps / DevSecOps
- Platform Engineering
- Support / SRE
- Security
- Developers
- and more...

<!-- 
Job orchestration is particularly important in DevOps and DevSecOps teams, where it facilitates the coordination of tasks across development, operations, security, and QA teams. This ensures that different teams involved in the software development lifecycle are not working in silos, and it helps automate the manual steps in the deployment and management of applications​​.

Platform engineering teams benefit from job orchestration by improving resource utilization, enabling scalability and elasticity, and supporting multicloud and hybrid cloud environments. Orchestration facilitates self-service opreations, ensures high availability and fault tolerance, and optimizes costs through efficient workload allocation. It standardizes workflows, eliminating manual, ticket-driven processes, and integrates with various infrastructure resources to support diverse workloads​​.

Support teams can streamline and automate operational tasks without compromising security. Courier's centralize control over automation, allowing support teams to execute predefined jobs for common issues, thereby reducing manual effort and response times. They enhance efficiency by providing a consistent, repeatable process for resolving incidents and performing routine maintenance tasks. This leads to faster resolution of support tickets, improved system reliability, and allows support staff to focus on more strategic work instead of repetitive tasks.

Security teams can find Courier particularly beneficial for incident management, aiming to reduce the time spent on repetitive tasks and to shorten the duration of incidents with fewer escalations. It allows for the creation of workflows (referred to as "jobs") that can be triggered via the web interface, API, CLI, or on a schedule. These workflows can incorporate any existing tools or scripts, facilitating a seamless integration into current operational procedures. Chef Platform's access control features further enhance its utility by allowing the safe delegation of task execution to users who traditionally might not have access to operational tools​​.

Additionally, job orchestration is critical for cloud orchestration, container management, and security orchestration, among other areas. It allows organizations to manage complex deployments, automate container management tasks, and ensure that automated security tools work together effectively​​.
-->



---
<!-- _paginate: "false" -->
![bg right](https://images.unsplash.com/photo-1516031190212-da133013de50)
<!-- image source: "https://unsplash.com/photos/a-computer-screen-with-a-program-running-on-it-eygpU6KfOBk" -->

## User Experience
- CLI
- Open APIs
- Web UI

<!--
Chef has always been a powerful tool that integrates well within the existing workflows of customers. Courier will continue the tradition and be available through:

A Powerful CLI: For customers who have the need or preference to work on their terminal 
As APIs: Customers can access all actions of Courier through its APIs and integrate Courier into their pipelines and automation systems
An Intuitive UI Experience: A simple visual interface to create Courier templates and access reports (comming in 2024)

At launch users interact with Courier primarily through the CLI, and an extesnive API, regardless of the interace choosen, Chef Courier offers a consistent feature set across all interfaces​​.
-->

---
![bg right:58% w:100%](./images/courier-logical.jpg)
## Platform Components
- Node Management
- Courier
- Chef Platform

---
![bg right](https://images.unsplash.com/photo-1583361704493-d4d4d1b1d70a)
<!-- image source: "https://unsplash.com/photos/white-printer-paper-with-black-text-1UDjq8s8cy0" -->
# Terminology
•	Slide: Terminology 
•	Speaking Notes: quick review of any unique terminology

---
# Overview of Infrastructure as Code (IaC)
•	Slide: Overview of Infrastructure as Code (IaC)
•	Speaking Notes: Explain the concept of IaC, explain provisioning vs post provisioning, and Target Mode vs Agent Mode

---
# Part 2: 
#### Tool(s) introduction 
###### Chef, Test Kitchen, and InSpec

---
# Introduction to Chef
•	Speaking Notes: Brief on Chef, components (workstation, Chef server, nodes), and cookbooks/policy files.



<!-- 
The platform stands out for its ability to integrate with a wide range of automation tools (e.g., Ansible, Puppet, Chef, Jenkins, Docker, Kubernetes, and more), without requiring users to replace their existing scripts or commands. This approach acknowledges the reality of heterogeneous infrastructure and tooling within organizations, allowing Courier to serve as a unifying layer for executing workflows across various automation assets​​.

-->