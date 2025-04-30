---
marp: true
paginate: true
header: '![w:200px](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/header-logo.png)'
footer: '&copy; 2025 Progress Software Corporation and/or its subsidiaries or affiliates. All rights reserved.'
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
    text-align: center;
  }

title: Continuous Compliance
description: Best Practice Series - level 100. Compliance Phase
author: George Westwater, Progress Chef
url: https://github.com/chef/architecture-center/blob/main/best-practices/100-custom_resources/seminar/slides/marp.md
#image: https://marp.app/og-image.jpg
---
# Compliance

## Chef Compliance Phase

### Best Practices - level 100

![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/logo.png)

---
![bg right](https://images.unsplash.com/photo-1583361704493-d4d4d1b1d70a)
<!-- image source: "https://unsplash.com/photos/white-printer-paper-with-black-text-1UDjq8s8cy0" -->

# Terminology

## Compliance

<!--
In the context of Chef Compliance Phase and Chef InSpec, "compliance" refers to the adherence of an organization's IT infrastructure to specific standards, policies, or regulations. Commonly these standards relate to security or operational requirements.
-->

---
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/right-blue-1.png)
<!-- _paginate: "false" -->

## Compliance Phase

### Stress-free Compliance

<!--
The Chef Compliance Phase is a feature of the Chef Infra Client that integrates these compliance checks directly into the configuration management process. During the Compliance Phase, the Chef Infra Client executes InSpec profiles to evaluate the compliance of the node against the specified requirements. This ensures that compliance is continuously assessed and maintained as part of the regular configuration management workflow.

-->
---

<!-- _paginate: "false" -->
<!-- _header: "" -->
<!-- _footer: "" -->
![bg](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/bg-gray.png)

<div class="center">

## Audit Cookbook

## vs

## Compliance Phase

</div>

<!--
Prior to Chef 17, the Audit Cookbook was used to integrate compliance checks into the Chef Infra Client runs. It allowed users to execute InSpec profiles as part of their Chef run to assess and report on the compliance status of their nodes. The Audit Cookbook worked by downloading specified InSpec profiles and running them at the end of the Chef Infra Client run, then reporting the results to a specified location, such as Chef Automate or a JSON file.

With the introduction of the Compliance Phase in Chef Infra Client 17, the functionality of the Audit Cookbook has been integrated directly into the Chef Infra Client. The Compliance Phase essentially replaces the need for the Audit Cookbook by providing built-in support for running InSpec profiles as part of the Chef Infra Client run.

There are a few differences between the Audit Cookbook and the Compliance Phase:

1. **Integration**: The Compliance Phase is a built-in feature of Chef Infra Client, whereas the Audit Cookbook was an external cookbook that needed to be included in your run-list or cookbook dependencies.

2. **Configuration**: The Compliance Phase is configured using attributes under the `audit` namespace in the client.rb file or using Policyfiles, whereas the Audit Cookbook was configured using attributes in your node's run-list or within a wrapper cookbook.

3. **Simplicity**: The Compliance Phase simplifies the setup process by eliminating the need for an external cookbook and providing a more streamlined configuration approach.


As for functionality, the Compliance Phase covers the same core features as the Audit Cookbook, which is running InSpec profiles as part of the Chef Infra Client run and reporting the results. However, the Compliance Phase is designed to be a more integrated and streamlined approach to compliance checks within the Chef ecosystem.
-->

---

## Continuous Compliance

### Benefits

<!--
- **Speaker Note**: The Compliance Phase offers several advantages, including integrated compliance checks, streamlined workflow, immediate feedback, and customizable compliance checks. It ensures consistency, provides visibility and reporting, and reduces manual effort.
-->
---
<!-- _header: "" -->
![bg left](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/left-green-1.png)

## Getting Started with Compliance Phase

<!--
- **Speaker Note**: To use Compliance Phase, start by selecting relevant InSpec profiles that match your compliance requirements. Store these profiles in a version-controlled repository and optimize them for performance to minimize impact on system performance.
-->
---

## Effective Compliance Phase Implementation

<!--
- **Speaker Note**: Some best practices include using compliance waivers for known exceptions, integrating with reporting tools like Chef Automate, testing profiles in development, keeping profiles up-to-date, and documenting exceptions and remediations.
-->
---
<!-- _backgroundColor: #2486f9 -->
<!-- _color: #ffffff -->
<!-- _header: "" -->
<!-- _footer: "" -->
![bg](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/bg-blue.png)

<div class="center">

# Tips and Considerations

</div>
<!--
- **Speaker Note**: Consider the frequency of compliance checks and whether you need to run the full profile or benchmark on every run. Also, think about how you can securely manage sensitive data required by InSpec profiles.
-->

---
<!-- _header: "" -->
![bg left](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/left-blue-1.png)

## Managing Compliance Phase

- Enabling and Disabling
    (Compliance Phase)
- Include and Exclude
    (Specific Profiles)

<!--
- **Speaker Note**: You can disable the Compliance Phase from inside a cookbook by setting the `node['audit']['compliance_phase']` attribute to false. This allows you to control the behavior dynamically based on conditions within your cookbook logic.

- **Speaker Note**: To exclude a specific profile from the Compliance Phase, adjust the profile inclusion in the node attributes. This allows you to tailor the compliance checks to your specific needs without modifying the profile itself.

-->
---
<!-- _paginate: "false" -->
![bg right](https://images.unsplash.com/photo-1554224155-1696413565d3)
<!-- image source: "https://unsplash.com/photos/stack-of-papers-flat-lay-photography-tQQ4BwN_UFs" -->

## Embracing Compliance Phase

<!--
- **Speaker Note**: In conclusion, the Compliance Phase is a powerful tool for maintaining compliance and security in your infrastructure. By following best practices and leveraging its flexibility, you can ensure that your infrastructure remains compliant and secure.
-->

---

## Labs and Exercises

<!--
1. **Lab 1**: Setting Up and Configuring Compliance Phase
   - Participants will learn how to set up the Compliance Phase in their Chef Infra Client and configure it to use specific InSpec profiles.

2. **Lab 2**: Creating and Customizing InSpec Profiles
   - Participants will create custom InSpec profiles tailored to their organization's compliance requirements and learn how to optimize them for performance.

3. **Lab 3**: Integrating Compliance Phase with Reporting Tools
   - Participants will integrate the results of the Compliance Phase with Chef Automate to gain visibility into the compliance status of their infrastructure.

4. **Lab 4**: Managing Exceptions and Waivers
   - Participants will learn how to use InSpec waivers to manage known exceptions and document the reasons for exceptions and planned remediation steps.

5. **Lab 5**: Disabling Compliance Phase and Specific Profiles
   - Participants will practice disabling the Compliance Phase and specific profiles within a cookbook to understand how to tailor compliance checks to specific scenarios.

By the end of these labs, participants will have a solid understanding of how to implement and manage the Compliance Phase in their Chef Infra Client setups, ensuring continuous compliance and security of their infrastructure.
-->