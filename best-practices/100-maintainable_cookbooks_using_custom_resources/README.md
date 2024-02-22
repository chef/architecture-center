# Best Practice Series
## Building Maintainable Cookbooks

**Using Custom Resources (Level 101)**

## Best Practice
Using custom resources instead of directly embedding all logic within a cookbook's recipes.

## Summary 
Custom resource provides several significant advantages for Chef practitioners. These benefits enhance the maintainability, reusability, and clarity of infrastructure as code. Here’s why custom resources are a preferable approach: 

## Benefits 
1. **Encapsulation and Modularity**:
Custom resources encapsulate specific functionality and configurations into standalone, modular components. This modular approach allows for cleaner, more organized cookbooks by separating concerns and reducing the complexity of recipes. It's easier to manage and update the logic of a specific resource when it's contained within its own definition rather than interspersed throughout various recipes.

2. **Reusability**:
Custom resources can be reused across different cookbooks and environments. Once you've created a custom resource for a particular task (e.g., managing a service, deploying a configuration file), you can easily apply it in multiple contexts without duplicating code. This reusability not only saves time but also ensures consistency across your infrastructure.

3. **Readability and Maintainability**:
Cookbooks filled with intricate scripting logic can become difficult to read and maintain. Custom resources abstract away complexity, presenting a simplified interface in recipes. For instance, a single line in a recipe using a custom resource can replace dozens of lines of resource declarations and Ruby code. This abstraction makes cookbooks more accessible to new team members and reduces the cognitive load required to understand and maintain the infrastructure code.

4. **Idempotency and Convergence**:
Custom resources, by design, promote idempotent behavior—ensuring that the same set of actions can be executed repeatedly without changing the system state beyond the initial application. This idempotency is central to Chef's convergence model, where the goal is to bring the system into a desired state without unintended side effects. Custom resources make it easier to define the desired state and the actions to achieve it in a controlled, predictable manner.

5. **Enhanced Error Handling**:
With custom resources, you can implement sophisticated error handling within the resource itself, encapsulating validation logic and exceptions. This localized error handling improves the robustness of your infrastructure code by ensuring that errors are caught and managed close to their source, reducing the risk of unhandled exceptions during cookbook executions.

6. **Better Testing and Debugging**:
Custom resources can be tested independently of recipes or cookbooks, allowing for more granular testing strategies. This isolation simplifies debugging and unit testing, enabling developers to validate the functionality of individual resources without executing the entire cookbook. Furthermore, testing frameworks can facilitating comprehensive testing practices.

7. **Resource Clarity and Self-documentation**:
The declarative nature of custom resources, with clearly defined properties and actions, serves as a form of self-documentation. This clarity benefits not only current team members but also aids in the onboarding of new staff, providing them with an understandable map of infrastructure components and their management logic.




 
Interactive Seminar + Lab

Assets:

Name	Type	Location
Seminar PPT	Power Point	----TBD----
Lab(s) – Content	GitHub Repo	----TBD----
Hosted Lab Environment	Cloud Formation	----TBD----
Bring Your Own Lab Requirements	Markdown	----TBD----


Session Overview
•	Duration: 60 - 90 minutes
•	Audience: Intermediate to advanced Chef users familiar with basic Chef cookbook concepts.
•	Prerequisites:
•	Familiar with Chef Cookbooks
•	Familiar with Chef Resources as a concept
•	Objectives:
•	Understand what custom resources are and why they are used.
•	Learn to create custom resources within Chef cookbooks.
•	Explore best practices for using and testing custom resources.
Seminar: 
•	Part 1: Introduction to Custom Resources
o	Slide: What are Custom Resources?
	Speaking Notes: Define custom resources in the context of Chef. Explain how they encapsulate complex logic for reusability and maintainability.
o	Slide: Benefits of Using Custom Resources
	Speaking Notes: Discuss the benefits of custom resources, including DRY principles, simplification of recipes, and enhanced readability and maintainability of cookbooks.
•	Part 2: Creating Custom Resources (25 mins)
o	Slide: Anatomy of a Custom Resource (10 mins)
	Speaking Notes: Break down the structure of a custom resource, including properties, actions, and why each part is important. Use a simple example, like a resource for managing a configuration file.
o	Slide: Writing Your First Custom Resource (15 mins)
	Speaking Notes: Step-by-step guide on creating a custom resource. Start with defining the resource's purpose, declaring properties, writing actions (e.g., :create, :delete), and providing default action. Highlight the use of Chef resources within actions to perform tasks.
•	Part 3: Best Practices for Custom Resources (15 mins)
o	Slide: Best Practices in Custom Resource Development 
	Speaking Notes: Emphasize key best practices, such as naming conventions, idempotency, using load_current_value for current state management, and writing clear documentation. Mention the importance of unit testing, and linting custom resources, and potential integration with InSpec.

•	Part 4: Lab Exercise #1

•	Part 5: Cookbook Design Patterns
o	Slide: Environment and Application 
	Speaking Notes: Introduce the environment and application cookbook patterns, explaining how they structure cookbook development for managing environments and applications. Discuss how custom resources fit into these patterns, aiding in creating more modular and manageable cookbooks.
o	Slide: Implicit vs Explicit Execution 
	Speaking Notes: Begin by highlighting the importance of execution patterns in Chef cookbooks, which dictate how resources are processed and executed by the Chef client.
•	Implicit Execution: Explain that implicit execution refers to the default behavior of Chef, where resources in recipes are executed in the order they appear. This is the simplest approach and works well for straightforward configurations. Emphasize that with implicit execution, the order is determined by the recipe code itself, without any explicit directives from the developer.
•	Explicit Execution: Contrast this with explicit execution, where the chef uses notifications (notifies and subscribes) or resource collections to manage the order and conditions under which resources are executed. This approach is crucial for complex configurations where the execution order depends on the state of the system or other resources.
•	Best Practices: Conclude with best practices for using explicit execution patterns, such as minimizing dependencies between resources to reduce complexity and ensuring idempotency by carefully managing resource notifications and subscriptions.
o	Slide: The Role of Attributes in Custom Resources
	Speaking Notes:

 
Labs

Lab Exercise #1 - Implementing a Custom Resource 
Objective
To create a custom resource in a Chef cookbook that manages a web application's configuration file. The resource should allow for the creation and deletion of the configuration file and the customization of its content based on properties.

Expected Outcomes
•	Participants will gain hands-on experience in creating and testing a custom resource, reinforcing the concepts discussed.
•	The lab will illustrate the process of encapsulating resource logic into a reusable component within Chef cookbooks.
•	Attendees will understand the importance of custom resources in simplifying cookbook complexity and improving code reuse.

Lab Activity:
•	Task 1: Create a custom resource named web_app_config that manages a configuration file for a web application. The resource should:
o	Have properties for file path, owner, group, and content.
o	Include actions :create and :delete. The :create action should create the file with specified content, owner, and group. The :delete action should remove the file if it exists.
•	Task 2: Write a simple InSpec test to verify the file is created with the correct content and permissions.
•	
