To use it, you will need sshpass, and for mac the used package manager is brew, so you can install it with:

```bash
brew install esolitos/ipa/sshpass
```

for linux you can install it with:

```bash
sudo apt-get install sshpass
```

To access the server with the IP, you can use the following command:

```bash
kubectl --insecure-skip-tls-verify command
```

But to make it default, edit the kubeconfig file and add the following line:

```yaml
apiVersion: v1
clusters:
  - cluster:
      # certificate-authority-data: LS0tLS1CRUdJTiBDRVJUSUZJQ0FURS0tLS0tCk1JSUJkekNDQVIyZ0F3SUJBZ0lCQURBS0JnZ3Foa2pPUFFRREFqQWpNU0V3SHdZRFZRUUREQmhyTTNNdGMyVnkKZG1WeUxXTmhRREUzTXpNNU1qWTJNek13SGhjTk1qUXhNakV4TVRReE56RXpXaGNOTXpReE1qQTVNVFF4TnpFegpXakFqTVNFd0h3WURWUVFEREJock0zTXRjMlZ5ZG1WeUxXTmhRREUzTXpNNU1qWTJNek13V1RBVEJnY3Foa2pPClBRSUJCZ2dxaGtqT1BRTUJCd05DQUFTR2RxbWR5ZUsxd0F5MlVIVDdsSFJsa0lPTDV6QmtyMkpPbVYxOTVKeTkKeEN3eUVFbWlGMHZjM0p2eTJ4UmlWNDZjM2NPc2RkVHNGTFkvWEJwZ0ZVNXVvMEl3UURBT0JnTlZIUThCQWY4RQpCQU1DQXFRd0R3WURWUjBUQVFIL0JBVXdBd0VCL3pBZEJnTlZIUTRFRmdRVW1SbGlUN0FyZlg1NlF4SWtDOGNUCnFacGx6cEl3Q2dZSUtvWkl6ajBFQXdJRFNBQXdSUUlnU2VmQWsyckd0cGVDQW91UittWTA1NlEwK0FGblk1TEoKQ2hhQ3RKbVRzWWtDSVFDRmFBcUtHOFg5V25QZlNBMUhvTDBKdzY0WXBwTS9GejhVNG93bCtZUEZNZz09Ci0tLS0tRU5EIENFUlRJRklDQVRFLS0tLS0K
      server: https://host:6443
      insecure-skip-tls-verify: true
```
