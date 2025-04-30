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

title: Building Maintainable Cookbooks
description: Best Practice Series - level 100. Introduction to Chef Courier
author: George Westwater, Progress Chef
url: https://github.com/chef/architecture-center/blob/main/best-practices/100-custom_resources/seminar/slides/marp.md
#image: https://marp.app/og-image.jpg
---
# Custom Resources
## Maintainable Cookbooks
### Best Practices - level 100
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/logo.png)

---
![bg right](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/right-blue-1.png)
<!-- _paginate: "false" -->
# Objectives

<!---
- Understand what custom resources are and why they are used.
- Learn to create custom resources within Chef cookbooks.
- Explore best practices for using and testing custom resources.
- Understand how custom resource make for more powerful cookbooks
-->

---
![bg right](https://images.unsplash.com/photo-1583361704493-d4d4d1b1d70a)
<!-- image source: "https://unsplash.com/photos/white-printer-paper-with-black-text-1UDjq8s8cy0" -->

# Terminology

## Resource

<!--
A resource in Chef represents a element or process, and its desired state. 

You can think about it as a fundamental building block in Chef recipes, used to describe the configuration of a system component. 

Each resource has a set of properties and actions that can be used to declare the desired state of that component. 

For example, a file resource can be used to manage the content, permissions, and ownership of a file on a system.
-->

---

## Example
<br/>

<div class="columns-2"> <div>

```ruby
file '/etc/motd' do
  content 'Welcome to my server!'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end
```
</div> <div>

```yaml
- type: file
  name: /etc/motd
  content: Welcome to my server!
  owner: root
  group: root
  mode: 0644  
  action: create
```

</div>

<!-- 
Here's a simple example of a file resource in a Chef recipe:
-->


---
![bg right](https://images.unsplash.com/photo-1583361704493-d4d4d1b1d70a)
<!-- image source: "https://unsplash.com/photos/white-printer-paper-with-black-text-1UDjq8s8cy0" -->

# Terminology

## Custom Resource
- Composition
- Extension

<!--
A custom resource in Chef is a user-defined resource that extends the capabilities of built-in resources. Custom resources allow you to encapsulate complex logic and reusable functionality into a single resource, making your recipes more modular and maintainable. 

They are defined in cookbooks and can be used just like built-in resources in your recipes.

Composition resources utilize other Core/Built in Chef Resources or other Custom resources to represent a behvior or process. For this session we will only be focusing on the Composition custom resources. 
These resources are written in Chef DSL

Extension custom resources focus on extending Chef's capabilities by adding a new building blocks, to be used by other resources/recipies. 
These resource are written in Ruby
-->

---

## Example

```ruby
resource_name :my_custom_resource

property :message, String, default: 'Hello, world!'

action :create do
  file '/tmp/my_custom_file' do
    content new_resource.message
    owner 'root'
    group 'root'
    mode '0644'
    action :create
  end
end
```
<!-- 
In this example, my_custom_resource is a custom resource that creates a file /tmp/my_custom_file with a customizable message.

Custom resources provide a powerful way to abstract and reuse complex configuration logic in your Chef cookbooks.
-->

---
```ruby
resource_name :web_server_setup

property :server_name, String, name_property: true
property :document_root, String, default: '/var/www/html'
property :index_content, String, default: '<h1>Welcome to my web server!</h1>'

action :create do
  # Install the Apache package
  package 'apache2' do
    action :install
  end

  # Hidden... Ensure the Apache service is running and enabled
  # Hidden... Create the document root directory if it doesn't exist
  
  # Create the index.html file with the specified content
  file "#{new_resource.document_root}/index.html" do
    content new_resource.index_content
    owner 'www-data'
    group 'www-data'
    mode '0644'
    action :create
  end
end
```

<!--
Note: Some steps have been hidden in the example for readability 

This example of a Chef custom resource that uses more than one resource within its action. This custom resource, named web_server_setup, will install and start a web server (Apache in this case) and create a simple HTML index page.

In this custom resource:
- The package resource installs the Apache web server package (apache2).
- (Hidden Step) The service resource ensures that the Apache service is enabled and running.
- (Hidden Step) The directory resource creates the document root directory for the web server, setting appropriate ownership and permissions.
- The file resource creates an index.html file in the document root with the specified content.
-->
---
# Custom Resources
## Benefits

- Encapsulation / Modularity
- Reusability / Readability
- Maintainability
- Idempotency and Convergence
- Better Testing and Debugging
- Easier Chef Client / Cookbook Upgrades

<!--
Encapsulation:
The modular nature of custom resources allows for cleaner, more organized cookbooks by separating concerns and reducing the complexity of recipes. It's easier to manage and update the logic of a specific resource when it's contained within its own definition rather than interspersed throughout various recipes.

In more advanced best practices we will discuss how and where to use attributes to ensure we have proper encapsulation.

Reusability:
This modular resources can be reused across different cookbooks and environments. Once you've created a custom resource for a particular task (e.g., managing a service, deploying a configuration file), you can easily apply it in multiple contexts without duplicating code. This reusability not only saves time but also ensures consistency across your infrastructure.

Maintainability:
Cookbooks filled with intricate scripting logic can become difficult to read and maintain. Custom resources abstract away complexity, presenting a simplified interface in recipes. For instance, a single line in a recipe using a custom resource can replace dozens of lines of resource declarations and Ruby code. 

This abstraction makes cookbooks more accessible to new team members and reduces the cognitive load required to understand and maintain the infrastructure code.

Idempotency:
Custom resources, by design, promote idempotent behavior. Custom resources make it easier to define the desired state and the actions to achieve it in a controlled, predictable manner.

Better Testing:
Custom resources can be tested independently of recipes or cookbooks, allowing for more granular testing strategies. 

Resource Clarity:
The declarative nature of custom resources, with clearly defined properties and actions, serves as a form of self-documentation. 
-->


---

<!-- _paginate: "false" -->
<!-- _header: "" -->
<!-- _footer: "" -->
![bg](https://raw.githubusercontent.com/chef/architecture-center/main/marp/images/bg-gray.png)


# Part 2: 
## Creating Custom Resources (25 mins)

<!--
Before we jump into the how, I want once per to stress the importance of this best practice. Not only will other best practice build upone this; but this one single behavior (build custom resources vs an inline recipe) will allow you to test easier, use YAML recipies with great affect/effect, and have a much easier maintaince cycle.

Why mention Yaml recipies?

At first glance YAML recipies have "limited" capabilities (compared to a ruby recipe); but in reality YAML recipies are designed as a forcing function to create custom resources.
-->

---

# Anatomy of a Composite Resource 

```ruby
provides :resource_name

property :property_name, RubyType, default: 'value'
default_action :action_a

action :action_a do
    # a mix of built-in Chef Infra resources and Custom Resources
end

action :action_b do
    # a mix of built-in Chef Infra resources and Custom Resources
end
```

<!--
Resource Name: This is the name used to reference the custom resource in recipes. It's defined using the resource_name method.

Properties: These are the parameters or attributes of the resource. Properties define the desired state of the resource and can have default values and data types.

You can add validation and coercion to properties to ensure that they receive valid inputs and to transform inputs into the desired format. This is done using options like required, regex, and coerce when defining properties.

Actions: Actions are the operations that the resource can perform. Each action contains a block of code that describes how to achieve a specific state. A custom resource must have at least one action, and one of the actions is typically marked as the default action.
-->

---
<!-- _header: "" -->
<!-- _footer: "" -->

# Anatomy of a Extension Resource 

```ruby
provides :resource_name

property :prop_one, RubyType, default: 'value'

default_action :action_a

load_current_value do |new_resource|
    # Use the load_current_value method to load the specified property values
end

action :action_a do
    converge_if_changed :prop_one do
        # code if prop_one has changed
    end
end

action :action_b do
    converge_if_changed :prop_one do
        # code if any propery has changed
    end
end
```

<!-- 
Load Current Value: This block is used to load the current state of the system into the resource's properties. It's useful for making the resource idempotent by comparing the desired state with the current state.

Convergance: Custom resources can provide specific rules about when to converage.

Notifications and Subscriptions: Custom resources can send notifications and subscribe to other resources' notifications, allowing for orchestrated updates and actions based on changes in the system.
-->

---

## Best Practices in Custom Resource Development
- Naming Conventions
- Idempotency
- Current State Management
- Documentation
- Unit Testing / InSpec Tests
- Linting

<!--
Naming Conventions
Adhering to naming conventions is crucial for clarity and consistency. Use descriptive, intuitive names for your custom resources and their properties. This makes it easier for others to understand and use your resources.

Idempotency
Ensuring idempotency is a core principle in Chef. Your custom resources should be designed to be idempotent, meaning they can be run multiple times without changing the system's state beyond the first run. This ensures that your resources are safe to use in different environments and scenarios.

Current State Management
Utilize the load_current_value method to load and compare the current state of the system with the desired state defined in your resource. This helps in making your resource more efficient and idempotent by avoiding unnecessary actions if the system is already in the desired state.

Documentation
Writing clear and comprehensive documentation for your custom resources is essential. Document each property and action, providing examples of how to use the resource. This helps other users understand the purpose and usage of your resource, making it more accessible and reusable.

Linting
Linting your custom resources helps maintain code quality and consistency. Use tools like Cookstyle to enforce style guidelines and best practices. This makes your code more readable and easier to maintain.

Testing
Unit testing your custom resources is important to ensure their reliability and functionality. Use ChefSpec or other testing frameworks to write tests that cover various scenarios and edge cases. This helps catch bugs early and ensures your resource behaves as expected.

Consider integrating your custom resources with InSpec for end 2 end testing, compliance and security validation. This allows you to write tests that ensure your resources are configuring the system according to your organization's policies and standards.
-->
---

# Part 3: 
#### Hands-On-Labs 

- Writing your first custom (composite) resource
- Writing a recipie that uses that resource
- Testing your resource