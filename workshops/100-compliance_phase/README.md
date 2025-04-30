# Best Practice Series

## Infra Client Compliance Phase

**Using Compliance Phase for Compliance (Level 101)**

## Best Practice

Use Chef Compliance phase for compliance and security to ensure consistent and continuous assessment of infrastructure against defined standards. This streamlined workflow not only enhances security posture but also reduces manual effort and potential human errors, making it easier for organizations to maintain compliance and focus on other critical aspects of their operations.

## Summary

The Chef Compliance Phase is a feature introduced in Chef Infra Client 17 that allows you to integrate compliance audits directly into your Chef Infra Client runs. This means that you can automatically assess and report on the compliance status of your nodes as part of their configuration management process.

During the Compliance Phase, the Chef Infra Client will execute InSpec profiles to evaluate the compliance of the node against specified requirements or benchmarks.

The Compliance Phase helps streamline the process of maintaining compliance by integrating it directly into your infrastructure automation workflows.

## Benefits

1. **Integrated Compliance Checks**: By integrating compliance checks directly into the Chef Infra Client run, you ensure that compliance assessments are performed consistently and automatically as part of your configuration management process. This reduces the likelihood of compliance drift and ensures that your infrastructure remains compliant over time.
2. **Streamlined Workflow**: Combining configuration management and compliance checks into a single workflow simplifies the process of maintaining compliance. You can manage both infrastructure code and compliance code in one place, using the same tools and processes.
3. **Immediate Feedback**: The Compliance Phase provides immediate feedback on the compliance status of your nodes during each Chef Infra Client run. This allows you to quickly identify and remediate compliance issues, reducing the risk of non-compliance.
4. **Customizable Compliance Checks**: You can use InSpec profiles to define custom compliance checks that are tailored to your organization's specific requirements. This flexibility allows you to focus on the compliance rules that are most relevant.
5. **Consistency**: By automating compliance checks with the Compliance Phase, you can ensure consistency in compliance assessments across your entire infrastructure.
6. **Visibility and Reporting**: The results of the Compliance Phase can be integrated with reporting tools such as Chef Automate, providing visibility into the compliance status of your infrastructure. This helps you track compliance over time and demonstrate compliance to auditors or stakeholders.
7. **Reduced Manual Effort**: Automating compliance checks with the Compliance Phase reduces the manual effort required to audit your infrastructure. This frees up time for your team to focus on other important tasks and initiatives.

## Using Compliance Phase

8. **Select Relevant InSpec Profiles**: Choose InSpec profiles that are relevant to your organization's compliance requirements and the specific technologies used in your infrastructure. Customize profiles as needed to fit your specific use cases.
9. **Version Control Profiles**: Store your InSpec profiles in a version-controlled repository. This ensures that changes are tracked, and you can easily revert to previous versions if necessary.
10. **Minimize Impact on Performance**: Compliance checks can add overhead to your Chef Infra Client runs. Optimize your InSpec profiles for performance, and consider scheduling compliance checks during off-peak hours or at a frequency that balances compliance needs with system performance.
11. **Use Compliance Waivers**: If there are known exceptions to your compliance rules, use InSpec waivers to document and exclude these controls from causing failures. This keeps your compliance reports accurate and focused on actionable issues.
12. **Integrate with Reporting Tools**: Configure the Compliance Phase to report results to a centralized dashboard or reporting tool, such as Chef Automate. This provides visibility into your compliance status across your entire infrastructure.
13. **Test Profiles in Development**: Before deploying InSpec profiles to production, test them in a development or staging environment. This helps identify any issues or false positives that need to be addressed.
14. **Keep Profiles Up-to-Date**: Regularly update your InSpec profiles to reflect changes in compliance requirements, security best practices, and your infrastructure.
15. **Document Exceptions and Remediations**: For any compliance failures, document the reasons for the exceptions and the planned remediation steps. This helps maintain transparency and accountability in your compliance process.
16. **Secure Sensitive Data**: If your InSpec profiles require sensitive data, such as credentials, use a secret management system to securely manage and access this data.
17. **Continuous Improvement**: Regularly review your compliance process and selected InSpec profiles to identify areas for improvement. Stay informed about updates to compliance standards and best practices in infrastructure security.

## Considerations

1. Do you really need to do the full Profile or Benchmark on every run?

## Tips ....

### Disabling Compliance Phase

Yes, you can disable the Compliance Phase from inside a cookbook by setting the node['audit']['compliance_phase'] attribute to false within a recipe. This approach allows you to control the behavior dynamically based on conditions within your cookbook logic.

```ruby
# Disable the Compliance Phase for this node
node.override['audit']['compliance_phase'] = false
```

By setting this attribute within a cookbook, you can disable the Compliance Phase for specific nodes or under certain conditions, without needing to modify the client.rb file or use command-line options. This provides flexibility in managing the Compliance Phase behavior across your infrastructure.

### Disabling a Profile

If you are using the audit cookbook to manage the Compliance Phase, you can adjust the profile inclusion in the node attributes. For example, to exclude a specific profile:

```ruby
default['audit']['profiles'] = {
  'my_profile' => {
    'compliance': 'user/my_profile',
    'enabled': false
  }
}
```

This approach allows you to control which profiles are included in the Compliance Phase without modifying the profile itself.

By using these methods, you can selectively disable specific InSpec profiles or controls in the Compliance Phase, allowing you to tailor the compliance checks to your specific needs.
