## Google Cloud Global VPC Network

Google Cloud's Virtual Private Cloud (VPC) Network is a highly customizable global network that supports various services within Google Cloud. This guide will help you manage and understand the functionalities of a global VPC network on Google Cloud, including private service connect and private services access.

### Design Decisions

1. **Routing Mode:** The network is configured with a GLOBAL routing mode to enable efficient communication across regions.
2. **IP Address Allocation:** Specific IP addresses are reserved for private service connect and private services access to ensure secure and efficient use of Google Cloud services.
3. **Dependency Management:** The Terraform module ensures that required APIs are enabled and properly set up before configuring the VPC, addressing any dependency issues.
4. **Service Access:** The VPC network is designed to support private service access, allowing you to communicate internally without relying on public IP addresses.

### Runbook

#### Issue: Unable to Access Google APIs Privately

Sometimes, you might face issues accessing Google APIs via Private Service Connect. You can use the following commands to troubleshoot and identify the problem.

**List Existing Global Addresses and Forwarding Rules**

Use these commands to see if the necessary global addresses and forwarding rules are in place:

```sh
gcloud compute addresses list --global
gcloud compute forwarding-rules list --global
```

Ensure that there are entries for Private Service Connect.

**Check VPC Peering Connections**

Verify that the VPC peering connection is established correctly:

```sh
gcloud compute networks peerings list --network=YOUR_NETWORK_NAME
```

Check for entries related to `servicenetworking.googleapis.com`.

#### Issue: IP Range Allocation for Private Services

If IP ranges for private services are not properly allocated, it can cause connectivity issues. Use the following command to debug:

```sh
gcloud compute addresses describe YOUR_ADDRESS_NAME --global
```

Make sure the address type is INTERNAL and it is reserved for VPC peering.

#### Checking VPC Routes and Subnets

If there are routing issues within the VPC, use these commands to list the routes and subnets configurations:

```sh
gcloud compute routes list --filter="network:YOUR_NETWORK_NAME"
gcloud compute networks subnets list --filter="network:YOUR_NETWORK_NAME"
```

Ensure that there are no conflicting routes and the subnets are correctly created.

#### Google Service Networking Configuration

If the service networking connection has issues, verify the status using:

```sh
gcloud services vpc-peerings list --network=YOUR_NETWORK_NAME
```

Check if `servicenetworking.googleapis.com` is listed and the connection is in an `ACTIVE` state.

This concludes troubleshooting guidance for common issues with managing a global VPC network on Google Cloud.

