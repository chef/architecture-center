---
marp: true
#theme: uncover
#class:
#  - lead
paginate: true
header: Progress Chef - Archiecture Center
footer: 2024
---
# Part 1: 
#### Introduction to IaC Testing
###### What and Why

---
# Slide 2
Slide: Set the Context
Speaking Notes

---
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

---
# Introduction to Test Kitchen Overview
•	Speaking Notes: Explain Test Kitchen’s role in testing cookbooks across various platforms before production deployment.

---
# slide: InSpec Introduction
•	Speaking Notes: Describe InSpec as a testing framework for infrastructure compliance and security.

---
# Part 3: 
#### Best Practices
###### Testing with Chef, Test Kitchen, and InSpec

---
# Writing Testable Chef Cookbooks 
•	Speaking Notes: Emphasize modular code, using resources effectively, metadata to manage dependencies.
•	Best Practices: Small, reusable recipes, version pinning in metadata, test-driven development (TDD).

---
# Utilizing Test Kitchen 
•	Speaking Notes: Configuration of .kitchen.yml, platform testing, integration with cloud services for testing.
•	Best Practices: Multi-platform testing strategy, using kitchen-dokken for speed, leveraging kitchen-cloud for real-world testing environments.

---
# Writing InSpec Tests
•	Speaking Notes: Structure of InSpec tests, importance of compliance as code.
•	Best Practices: Covering critical security and compliance checks, parameterizing tests for reusability, continuous testing in CI/CD pipelines.

---
# Linting
•	Speaking Notes:
•	Best Practices:

---
# Part 4
#### Lab Exercise #1
###### ............

•	Part 5: Integrating Test Kitchen with CI/CD Pipelines 
•	Slide: CI/CD Basics and Importance for IaC
•	Speaking Notes: Introduce CI/CD concepts, emphasizing the role of automation in building, testing, and deploying code changes. Highlight the importance of including IaC in these pipelines to ensure infrastructure changes are also tested and reliable.
•	Best Practices: Automate everything, keep the build fast, test in representation of the production environment(s).
•	Slide: Considerations for CI/CD for Chef Cookbooks 
•	Speaking Notes: Discuss the setup of a CI/CD pipeline specific to Chef cookbooks, including the tools (e.g., Jenkins, GitHub Actions, GitLab CI) and the stages of the pipeline (lint, unit test, integration test).
•	Best Practices: Use linting tools (e.g., Cookstyle) for static code analysis, Unit tests with ChefSpec, and integration tests with Test Kitchen.
•	Slide: Considerations for Integrating Test Kitchen into CI/CD 
•	Speaking Notes: Discuss how to integrate Test Kitchen into CI/CD pipelines, using Docker for testing environments to speed up execution. Outline steps for configuring .kitchen.yml to use docker and setting up environment variables for dynamic configuration.
•	Best Practices: Parallelize Test Kitchen instances to reduce testing time, cache base Docker images to speed up builds, clean up testing environments after tests to conserve resources.
•	Slide: Continuous Compliance and Security Testing with InSpec 
•	Speaking Notes: Emphasize the need for continuous compliance and security testing within CI/CD pipelines using InSpec. Discuss how to automate InSpec tests post-convergence in Test Kitchen or as a separate stage in the pipeline.
•	Best Practices: Integrate compliance as part of the definition of done, ensure InSpec profiles are version controlled and reviewed, use InSpec for compliance and security  gate checks in the pipeline.

•	Part 6: Lab Exercise #2 (time permitting)

•	Part 7: Wrap-Up and Q&A
•	Slide: Review of Key Points 
•	Speaking Notes: Recap best practices, importance of testing, and the role of InSpec in compliance.
•	Q&A Session:
•	Open the floor to questions, encourage sharing of experiences or concerns with testing infrastructure as code.
