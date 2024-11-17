# Feature Flags

Feature flags (also known as feature toggles or feature switches) are a software development technique that allows developers to enable or disable functionality in an application without deploying new code. They provide a way to modify system behavior without changing code.

## Key Benefits

- **Controlled Feature Rollouts**: Gradually release features to specific user groups
- **A/B Testing**: Test different versions of features with different user segments
- **Risk Mitigation**: Quickly disable problematic features without redeployment
- **Decoupled Deployment**: Separate code deployment from feature release

## Common Use Cases

1. **Progressive Rollouts**

   - Release features to a small percentage of users
   - Gradually increase exposure based on feedback
   - Roll back if issues are discovered

2. **User Targeting**

   - Enable features for specific user segments
   - Test features with internal users first
   - Provide different experiences based on user attributes

3. **Operations Control**
   - Enable/disable features based on system load
   - Manage feature availability during maintenance
   - Control access to beta features

## Implementation Best Practices

- Keep feature flag logic simple and clean
- Regularly clean up old feature flags
- Document feature flags and their purpose
- Use a feature flag management system
- Monitor feature flag usage and impact

## Unleash

Unleash is a feature flagging system that allows you to control the release of new features to your users. It is a powerful tool that allows you to test new features, manage feature rollouts, and control feature availability.

access it http://localhost:4242/api/frontend/ with the api key on 'Authorization' header

When the feature is enabled in development, you can see it in the toggle property of the response.

To make filterings you could pass the following parameters:

- environment: The environment you want to check the feature flag in.
- appName: The name of the application you want to check the feature flag in.
- userId: The user id you want to check the feature flag for.

Registering new applications, defining it's strategies and toggles are made in the admin panel.

### Deployment

You have to include it into the infra and in the ingress of kube:

```yaml
rules:
  - host: ""
    http:
      paths:
        - path: /
          pathType: Prefix
          featureFlag:
            service:
              name: unleash-service
              port:
                number: 4242
```

It is also necessary to create a Postgres database and configure the Unleash to use it. Futhermore it is important to match the environment variable.

```sh
DATABASE_HOST=postgres
DATABASE_NAME=unleash
DATABASE_USERNAME=unleash_user
DATABASE_PASSWORD=some_password
DATABASE_SSL=false
```
