[![Massdriver][logo]][website]

# gcp-global-network

[![Release][release_shield]][release_url]
[![Contributors][contributors_shield]][contributors_url]
[![Forks][forks_shield]][forks_url]
[![Stargazers][stars_shield]][stars_url]
[![Issues][issues_shield]][issues_url]
[![MIT License][license_shield]][license_url]


A global private isolated virtual network that provides managed networking functionality for your Google Cloud Platform (GCP) resources.


---

## Design

For detailed information, check out our [Operator Guide](operator.md) for this bundle.

## Usage

Our bundles aren't intended to be used locally, outside of testing. Instead, our bundles are designed to be configured, connected, deployed and monitored in the [Massdriver][website] platform.

### What are Bundles?

Bundles are the basic building blocks of infrastructure, applications, and architectures in [Massdriver][website]. Read more [here](https://docs.massdriver.cloud/concepts/bundles).

## Bundle

### Params

Form input parameters for configuring a bundle for deployment.

<details>
<summary>View</summary>

<!-- PARAMS:START -->
## Properties

- **`private_service_connect_ip`** *(string)*: Internal IP address to use for accessing Google APIs, such as CloudFunctions, GCR or Cloud Storage, privately instead of over the internet via public IPs. This IP cannot conflict with any existing subnets or peered networks. More info: https://cloud.google.com/vpc/docs/configure-private-service-connect-apis. Default: `10.127.255.255`.

  Examples:
  ```json
  "0.0.0.0"
  ```

  ```json
  "8.8.8.8"
  ```

  ```json
  "127.0.0.1"
  ```

- **`private_services_access_cidr`** *(string)*: CIDR range to deploy GCP services to. This range cannot be used for any other purpose and cannot conflict with existing subnets or peered networks. This range is used by Google to deploy services like MemoryStore and CloudSQL without requiring individual peering connections per instance. More info: https://cloud.google.com/vpc/docs/private-services-access. Default: `10.127.0.0/17`.

  Examples:
  ```json
  "10.100.0.0/16"
  ```

  ```json
  "192.24.12.0/22"
  ```

## Examples

  ```json
  {
      "__name": "Private",
      "private_service_connect_ip": "10.127.255.255",
      "private_services_access_cidr": "10.127.0.0/17"
  }
  ```

  ```json
  {
      "__name": "Wizard",
      "private_service_connect_ip": "10.127.255.255",
      "private_services_access_cidr": "10.127.0.0/17"
  }
  ```

<!-- PARAMS:END -->

</details>

### Connections

Connections from other bundles that this bundle depends on.

<details>
<summary>View</summary>

<!-- CONNECTIONS:START -->
## Properties

- **`gcp_authentication`** *(object)*: GCP Service Account. Cannot contain additional properties.
  - **`data`** *(object)*
    - **`auth_provider_x509_cert_url`** *(string)*: Auth Provider x509 Certificate URL. Default: `https://www.googleapis.com/oauth2/v1/certs`.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`auth_uri`** *(string)*: Auth URI. Default: `https://accounts.google.com/o/oauth2/auth`.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`client_email`** *(string)*: Service Account Email.

      Examples:
      ```json
      "jimmy@massdriver.cloud"
      ```

      ```json
      "service-account-y@gmail.com"
      ```

    - **`client_id`** *(string)*: .
    - **`client_x509_cert_url`** *(string)*: Client x509 Certificate URL.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`private_key`** *(string)*: .
    - **`private_key_id`** *(string)*: .
    - **`project_id`** *(string)*: .
    - **`token_uri`** *(string)*: Token URI. Default: `https://oauth2.googleapis.com/token`.

      Examples:
      ```json
      "https://example.com/some/path"
      ```

      ```json
      "https://massdriver.cloud"
      ```

    - **`type`** *(string)*: . Default: `service_account`.
  - **`specs`** *(object)*
    - **`gcp`** *(object)*: .
      - **`project`** *(string)*
      - **`region`** *(string)*: The GCP region to provision resources in.

        Examples:
        ```json
        "us-east1"
        ```

        ```json
        "us-east4"
        ```

        ```json
        "us-west1"
        ```

        ```json
        "us-west2"
        ```

        ```json
        "us-west3"
        ```

        ```json
        "us-west4"
        ```

        ```json
        "us-central1"
        ```

<!-- CONNECTIONS:END -->

</details>

### Artifacts

Resources created by this bundle that can be connected to other bundles.

<details>
<summary>View</summary>

<!-- ARTIFACTS:START -->
## Properties

- **`network`** *(object)*: . Cannot contain additional properties.
  - **`data`** *(object)*
    - **`grn`** *(string)*: GCP Resource Name (GRN).

      Examples:
      ```json
      "projects/my-project/global/networks/my-global-network"
      ```

      ```json
      "projects/my-project/regions/us-west2/subnetworks/my-subnetwork"
      ```

      ```json
      "projects/my-project/topics/my-pubsub-topic"
      ```

      ```json
      "projects/my-project/subscriptions/my-pubsub-subscription"
      ```

      ```json
      "projects/my-project/locations/us-west2/instances/my-redis-instance"
      ```

      ```json
      "projects/my-project/locations/us-west2/clusters/my-gke-cluster"
      ```

    - **`private_service_connect_ip`** *(string)*: IP address of the Private Service Connect endpoint.
    - **`private_services_access`** *(object)*
      - **`cidr`** *(string)*: CIDR range of the Private Services Access block.

        Examples:
        ```json
        "10.100.0.0/16"
        ```

        ```json
        "192.24.12.0/22"
        ```

      - **`name`** *(string)*: Name of the Private Services Access block.
  - **`specs`** *(object)*
    - **`gcp`** *(object)*: .
      - **`project`** *(string)*
      - **`region`** *(string)*: The GCP region to provision resources in.

        Examples:
        ```json
        "us-east1"
        ```

        ```json
        "us-east4"
        ```

        ```json
        "us-west1"
        ```

        ```json
        "us-west2"
        ```

        ```json
        "us-west3"
        ```

        ```json
        "us-west4"
        ```

        ```json
        "us-central1"
        ```

<!-- ARTIFACTS:END -->

</details>

## Contributing

<!-- CONTRIBUTING:START -->

### Bug Reports & Feature Requests

Did we miss something? Please [submit an issue](https://github.com/massdriver-cloud/gcp-global-network/issues) to report any bugs or request additional features.

### Developing

**Note**: Massdriver bundles are intended to be tightly use-case scoped, intention-based, reusable pieces of IaC for use in the [Massdriver][website] platform. For this reason, major feature additions that broaden the scope of an existing bundle are likely to be rejected by the community.

Still want to get involved? First check out our [contribution guidelines](https://docs.massdriver.cloud/bundles/contributing).

### Fix or Fork

If your use-case isn't covered by this bundle, you can still get involved! Massdriver is designed to be an extensible platform. Fork this bundle, or [create your own bundle from scratch](https://docs.massdriver.cloud/bundles/development)!

<!-- CONTRIBUTING:END -->

## Connect

<!-- CONNECT:START -->

Questions? Concerns? Adulations? We'd love to hear from you!

Please connect with us!

[![Email][email_shield]][email_url]
[![GitHub][github_shield]][github_url]
[![LinkedIn][linkedin_shield]][linkedin_url]
[![Twitter][twitter_shield]][twitter_url]
[![YouTube][youtube_shield]][youtube_url]
[![Reddit][reddit_shield]][reddit_url]

<!-- markdownlint-disable -->

[logo]: https://raw.githubusercontent.com/massdriver-cloud/docs/main/static/img/logo-with-logotype-horizontal-400x110.svg
[docs]: https://docs.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=gcp-global-network&utm_content=docs
[website]: https://www.massdriver.cloud/?utm_source=github&utm_medium=readme&utm_campaign=gcp-global-network&utm_content=website
[github]: https://github.com/massdriver-cloud?utm_source=github&utm_medium=readme&utm_campaign=gcp-global-network&utm_content=github
[slack]: https://massdriverworkspace.slack.com/?utm_source=github&utm_medium=readme&utm_campaign=gcp-global-network&utm_content=slack
[linkedin]: https://www.linkedin.com/company/massdriver/?utm_source=github&utm_medium=readme&utm_campaign=gcp-global-network&utm_content=linkedin



[contributors_shield]: https://img.shields.io/github/contributors/massdriver-cloud/gcp-global-network.svg?style=for-the-badge
[contributors_url]: https://github.com/massdriver-cloud/gcp-global-network/graphs/contributors
[forks_shield]: https://img.shields.io/github/forks/massdriver-cloud/gcp-global-network.svg?style=for-the-badge
[forks_url]: https://github.com/massdriver-cloud/gcp-global-network/network/members
[stars_shield]: https://img.shields.io/github/stars/massdriver-cloud/gcp-global-network.svg?style=for-the-badge
[stars_url]: https://github.com/massdriver-cloud/gcp-global-network/stargazers
[issues_shield]: https://img.shields.io/github/issues/massdriver-cloud/gcp-global-network.svg?style=for-the-badge
[issues_url]: https://github.com/massdriver-cloud/gcp-global-network/issues
[release_url]: https://github.com/massdriver-cloud/gcp-global-network/releases/latest
[release_shield]: https://img.shields.io/github/release/massdriver-cloud/gcp-global-network.svg?style=for-the-badge
[license_shield]: https://img.shields.io/github/license/massdriver-cloud/gcp-global-network.svg?style=for-the-badge
[license_url]: https://github.com/massdriver-cloud/gcp-global-network/blob/main/LICENSE


[email_url]: mailto:support@massdriver.cloud
[email_shield]: https://img.shields.io/badge/email-Massdriver-black.svg?style=for-the-badge&logo=mail.ru&color=000000
[github_url]: mailto:support@massdriver.cloud
[github_shield]: https://img.shields.io/badge/follow-Github-black.svg?style=for-the-badge&logo=github&color=181717
[linkedin_url]: https://linkedin.com/in/massdriver-cloud
[linkedin_shield]: https://img.shields.io/badge/follow-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&color=0A66C2
[twitter_url]: https://twitter.com/massdriver?utm_source=github&utm_medium=readme&utm_campaign=gcp-global-network&utm_content=twitter
[twitter_shield]: https://img.shields.io/badge/follow-Twitter-black.svg?style=for-the-badge&logo=twitter&color=1DA1F2
[discourse_url]: https://community.massdriver.cloud?utm_source=github&utm_medium=readme&utm_campaign=gcp-global-network&utm_content=discourse
[discourse_shield]: https://img.shields.io/badge/join-Discourse-black.svg?style=for-the-badge&logo=discourse&color=000000
[youtube_url]: https://www.youtube.com/channel/UCfj8P7MJcdlem2DJpvymtaQ
[youtube_shield]: https://img.shields.io/badge/subscribe-Youtube-black.svg?style=for-the-badge&logo=youtube&color=FF0000
[reddit_url]: https://www.reddit.com/r/massdriver
[reddit_shield]: https://img.shields.io/badge/subscribe-Reddit-black.svg?style=for-the-badge&logo=reddit&color=FF4500

<!-- markdownlint-restore -->

<!-- CONNECT:END -->
