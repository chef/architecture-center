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

## Writing Effective Composite Custom Resources

1. **Naming Conventions**:
Adhering to naming conventions is crucial for clarity and consistency. Use descriptive, intuitive names for your custom resources and their properties. This makes it easier for others to understand and use your resources.

2. **Idempotency**:
Ensuring idempotency is a core principle in Chef. Your custom resources should be designed to be idempotent, meaning they can be run multiple times without changing the system's state beyond the first run. This ensures that your resources are safe to use in different environments and scenarios.

3. **Linting**:
Linting your custom resources helps maintain code quality and consistency. Use tools like Cookstyle to enforce style guidelines and best practices. This makes your code more readable and easier to maintain.

4. **Integration with InSpec**:
Consider integrating your custom resources with InSpec for compliance and security testing. This allows you to write tests that ensure your resources are configuring the system according to your organization's policies and standards.

5. **Documentation**:
Writing clear and comprehensive documentation for your custom resources is essential. Document each property and action, providing examples of how to use the resource. This helps other users understand the purpose and usage of your resource, making it more accessible and reusable.


## Next Steps: Further Learning and Advanced Topics

- Using Attributes with Custom Resources - level 200
- Extending Chef with Custom Resources - level 300
- Support Chef Target Mode with Custom Resources - level 300
- Custom Resource Testing with CI/CD Pipelines - level 300
- Test Kitchen Alternatives - level 400