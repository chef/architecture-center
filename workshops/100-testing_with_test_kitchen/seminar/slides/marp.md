---
marp: true

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
  .center {
    text-align:center;
  }

title: Introduction to Chef Target Mode
description:  Best Practices Series - level 100. Developing Cookbooks with Test Kitchen
author: George Westwater, Progress Chef
url: https://github.com/chef/architecture-center/blob/main/best-practices/100-testing_cookbooks/seminar/slides/marp.md
#image: https://marp.app/og-image.jpg
---

# Testing with Test Kitchen
## Developing Cookbooks with Test Kitchen
### Best Practices - level 100
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/logo.png)


---
<!-- _paginate: "false" -->
<!-- _header: "" -->
<!-- _footer: "" -->
![bg](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/bg-gray.png)

<div class="center">

# Introduction to Chef, Test Kitchen, and InSpec 

</div>

---
![bg right](https://plus.unsplash.com/premium_photo-1658506988095-885269f2b56e)
<!-- _paginate: "false" -->
<!-- image source: "https://unsplash.com/photos/some-spices-and-dish-is-ready-PA-Xo2eF1cs" -->
<div class="center">

# What is Chef?
![width:200px](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/logo.png)

</div>

---
![bg right](https://images.unsplash.com/photo-1484480974693-6ca0a78fb36b)
<!-- _paginate: "false" -->
<!-- image source: "https://unsplash.com/photos/man-and-woman-standing-in-front-of-table-n4ymhyyFY7A" -->
<div class="center">

# What is InSpec?
![width:200px](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/logo.png)

</div>


---
![bg right](https://plus.unsplash.com/premium_photo-1666919058348-f64a57f83f61)
<!-- _paginate: "false" -->
<!-- image source: "https://unsplash.com/photos/a-person-holding-a-bowl-of-food-in-their-hand-6qQkzyz_FTI" -->
<div class="center">

# What is Workstation?
![width:200px](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/logo.png)

</div>

---
![bg right](https://images.unsplash.com/photo-1556911261-6bd341186b2f)
<!-- _paginate: "false" -->
<!-- image source: "https://unsplash.com/photos/person-writing-bucket-list-on-book-RLw-UC03Gwc" -->
<div class="center">

# What is Test Kitchen?
![Test Kitchen Logo](https://kitchen.ci/images/logo.png) 

</div>



---
<!-- _header: "" -->
![bg left](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/left-blue-1.png)
## Recap:
- Chef Infra Client
- Chef InSpec
- Chef Habitat
- Chef Knife
- Chef CLI
- Test Kitchen
- Cookstyle


---
<!-- _paginate: "false" -->
<!-- _header: "" -->
<!-- _footer: "" -->
![bg](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/bg-gray.png)

<div class="center">

# Best Practices 

## Testing with Chef, Test Kitchen, and InSpec

</div>

---
![bg right](https://images.unsplash.com/photo-1589152144820-692b189e0b34)
<!-- _paginate: "false" -->
<!-- image source: "https://unsplash.com/photos/text-Mfjq1hi-lVg" -->
<div class="center">

# Practice Makes Better

</div>

---
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/right-blue-1.png)
<!-- _paginate: "false" -->

# Testable Cookbooks:

- Small, reusable recipes
- Version pinning in metadata
- Custom resources
- Minimal Branching

<!--
Speaking Notes: Emphasize modular code, using resources effectively, metadata to manage dependencies.
-->

---
<!-- _header: "" -->
![bg left](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/left-blue-1.png)
## Effective Utilization of Test Kitchen

- Understand the Configuration
- Write Meaningful Tests
- Test Across Multiple Platforms
- Iterate Quickly with Test Kitchen Commands
- Debugging and Troubleshooting
- Keep Tests Up-to-Date
- Collaborate and Share

---
![bg right](https://images.unsplash.com/photo-1638414154639-0fbc5bceb80f)
<!-- _paginate: "false" -->
<!-- image source: "https://unsplash.com/photos/a-blurry-photo-of-a-light-in-the-dark-ouwdw--XNzo" -->

# Cookbooks are Code
- Use Version Control
- Multi-platform testing strategy
- Pipeline Integration

<!-- CI/CD -->




---
# Part 2: 
#### Hands-On-Labs 






