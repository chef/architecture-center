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

title: Introduction to Chef Target Mode
description: New Horizons Series - level 100. Introduction to Target Mode
author: George Westwater, Progress Chef
url: https://github.com/chef/architecture-center/blob/main/new-horizons/100-target-mode/seminar/slides/marp.md
#image: https://marp.app/og-image.jpg
---

# Chef Target Mode
## Introduction to Chef Target Mode
### New Horizons - level 100
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/logo.png)



---
![bg right](https://images.unsplash.com/photo-1589959864690-24091a905ea1)
<!-- _paginate: "false" -->
<!-- image source: "https://unsplash.com/photos/black-white-and-red-round-arrow-PFqfV5bn91A" -->
# What is Target Mode?

---
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/right-blue-1.png)
# Why Agentless?

<!--
Although Chef states that a pull-based (agent-based) configuration management system is the most secure option. 

Agents can not go on every device and can not manage API-based configuration systems.
-->

---
![bg right](https://images.unsplash.com/photo-1474487548417-781cb71495f3)
<!-- image source: https://unsplash.com/photos/yellow-and-black-train-on-railways-7KKQG0eB_TI -->

# Protocol Support
- SSH
- WinRM
- Rest (HTTP/HTTPS)
- Cloud (AWS, Azure, GCP, ...)
- Kubernetes
- ...

---

# Resource Support
![bg right](https://images.unsplash.com/photo-1628258334105-2a0b3d6efee1)
<!-- image source: https://unsplash.com/photos/macbook-pro-on-black-wooden-table-PNbDkQ2DDgM -->

---
# Brief History
- 15.0.293 – introduced Target Mode
- 15.1.0 – large performance improvements (re-using existing connections)
- 16.6.14 – “most” Ohai plugins now support target mode
- 17.7.22 – credential file now supports transport protocol
- 18.0.155 – introduces first native Target Mode resource (REST)

---
# Limitations
- No out-of-the-box orchestrator
- No out-of-the-box node mapping to Infra Server / Automate
- Limited native resources
- Resources are not protocol aware

(we are going to cover overcomming limitation later)

---
<!-- _paginate: "false" -->
<!-- _header: "" -->
<!-- _footer: "" -->
![bg](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/bg-gray.png)
# Technical Bits


---

# Custom Resources

```
resource_name :NAME_OF_RESOURCE
provides :NAME_OF_RESOURCE target_mode: true
unified_mode true

load_current_value do |new_resource|
...
end

action :YOUR_ACTION do
...
end
```

---

# Credentials File

```
['NAME']
client_name                 = ''
client_key                  = ''
validation_client_name      = ''
validation_key              = ''
chef_server_url             = ''
cookbook_path               = ["",""]

host                        = '192.168.0.251'
user                        = 'root'
password                    = '123456'
target_protocol             = 'ssh'
['myserver']
```

---