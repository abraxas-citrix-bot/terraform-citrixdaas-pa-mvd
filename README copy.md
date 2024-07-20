<<<<<<< HEAD
<!-- BEGIN_TF_DOCS -->
=======
[![Maintained](https://img.shields.io/badge/Maintained%20by-MVD-success)](https://www.abraxas.ch)
[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.1.6-blue)](https://terraform.io)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Table of Contents

- [Introduction](#introduction)
- [Guidelines](#guidelines)
- [Share the Love](#share-the-love)
- [Contributing](#contributing)
- [Bug Reports and Feature Requests](#bug-reports--feature-requests)
- [Developing](#developing)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

---

## Introduction

This is a template for Terraform modules.

It is part of our [MVD](https://www.abraxas.ch) Automation Forces Open Source community library to give you a quick start into Infrastructure as Code deployments with Terraform.

We have a lot of Terraform modules that are Open Source and maintained by the [MVD](https://www.abraxas.ch) staff.

Please check the links for more info, including usage information and full documentation:

- [MVD Website](https://www.abraxas.ch)
- [MVD Documentation](https://docs.MVD.io)
- [Twitter](https://twitter.com/MVD_io)
- [LinkedIn](https://www.linkedin.com/company/MVD_io)

---

## Guidelines

We are using the following guidelines to write code and make it easier for everyone to follow a distinctive guideline.
Please check these links before starting to work on changes.

[![Contributor Covenant](https://img.shields.io/badge/Contributor%20Covenant-2.1-4baaaa.svg)](CODE_OF_CONDUCT.md)

Git Naming Conventions are an important part of the development process.
They describe how Branches, Commit Messages,
Pull Requests and Tags should look like to make them easily understandable for everybody in the development chain.

[Git Naming Conventions](https://namingconvention.org/git/)

He Conventional Commits specification is a lightweight convention on top of commit messages.
It provides an easy set of rules for creating an explicit commit history; which makes it easier to write automated tools on top of.

[Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)

The better a Pull Request description is, the better a review can understand and decide on how to review the changes.
This improves implementation speed and reduces communication between the requester,
and the reviewer is resulting in much less overhead.

[Writing A Great Pull Request Description](https://www.pullrequest.com/blog/writing-a-great-pull-request-description/)

Versioning is a crucial part for Terraform Stacks and Modules.
Without version tags you cannot clearly create a stable environment
and be sure that your latest changes will not crash your production environment (sure it still can happen,
but we are trying our best to implement everything that we can to reduce the risk)

[Semantic Versioning](https://semver.org)

[Terraform Naming Conventions](https://www.terraform-best-practices.com/naming)

---

## Share the Love

Like this project?
Please give it a ★ on [our GitHub](https://github.com/MVD-io/terraform-module-template)!
It helps us a lot.

---

## Contributing

### Bug Reports & Feature Requests

Please use the issue tracker to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project, we would love to hear from you! Email us.

PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

- Fork the repo on GitHub
- Clone the project to your own machine
- Commit changes to your own branch
- Push your work back up to your fork
- Submit a Pull Request so that we can review your changes

> NOTE: Be sure to merge the latest changes from "upstream" before making a pull request!

---

## Usage

### Installation

For the first time using this template, necessary tools need to be installed.
A script to prepare a Mac is provided under ./build/init.ps1

This script will install the following dependencies:

- [pre-commit](https://github.com/pre-commit/pre-commit)
- [terraform-docs](https://github.com/terraform-docs/terraform-docs)
- [tflint](https://github.com/terraform-linters/tflint)
- [tfsec](https://github.com/aquasecurity/tfsec)
- [checkov](https://github.com/bridgecrewio/checkov)
- [terrascan](https://github.com/accurics/terrascan)
- [kics](https://github.com/Checkmarx/kics)

This script configures:

- global git template under ~/.git-template
- global pre-commit hooks for prepare-commit-msg and commit-msg under ~/.git-template/hooks
- GitHub actions:
  - linting and checks for pull requests from dev to master/main
  - automatic tagging and release creation on pushes to master/main
  - dependabot updates

It currently supports the automated installation for macOS. Support for Windows and Linux will be available soon.

### Synchronisation

We provided a script under ./build/sync_template.ps1 to fetch the latest changes from this template repository.
Please be aware that this is mainly a copy operation which means all your current changes have to be committed first,
and after running the script, you have to merge these changes into your codebase.

### Configuration

---

<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
>>>>>>> 43e5bd27807f12a9616fb6cc66e720743bdcaab7
## Requirements

| Name | Version |
|------|---------|
<<<<<<< HEAD
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.2 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.11.0, < 4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.11.0, < 4.0 |
=======
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.1.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.5.0 |

## Providers

No providers.
>>>>>>> 43e5bd27807f12a9616fb6cc66e720743bdcaab7

## Modules

No modules.

## Resources

<<<<<<< HEAD
| Name | Type |
|------|------|
| [azurerm_network_security_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group) | resource |
| [azurerm_network_security_rule.custom_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.custom_rules_for](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.predefined_rules](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_network_security_rule.predefined_rules_for](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_rule) | resource |
| [azurerm_resource_group.nsg](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/data-sources/resource_group) | data source |
=======
No resources.
>>>>>>> 43e5bd27807f12a9616fb6cc66e720743bdcaab7

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
<<<<<<< HEAD
| <a name="input_custom_rules"></a> [custom\_rules](#input\_custom\_rules) | Security rules for the network security group using this format name = [name, priority, direction, access, protocol, source\_port\_range, destination\_port\_range, source\_address\_prefix, destination\_address\_prefix, description] | `any` | `[]` | no |
| <a name="input_destination_address_prefix"></a> [destination\_address\_prefix](#input\_destination\_address\_prefix) | Destination address prefix to be applied to all predefined rules. list(string) only allowed one element (CIDR, `*`, source IP range or Tags). Example ["10.0.3.0/24"] or ["VirtualNetwork"] | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_destination_address_prefixes"></a> [destination\_address\_prefixes](#input\_destination\_address\_prefixes) | Destination address prefix to be applied to all predefined rules. Example ["10.0.3.0/32","10.0.3.128/32"] | `list(string)` | `null` | no |
| <a name="input_location"></a> [location](#input\_location) | Location (Azure Region) for the network security group. | `string` | `""` | no |
| <a name="input_predefined_rules"></a> [predefined\_rules](#input\_predefined\_rules) | Predefined rules | `any` | `[]` | no |
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | Name of the resource group | `string` | n/a | yes |
| <a name="input_rules"></a> [rules](#input\_rules) | Standard set of predefined rules | `map(any)` | <pre>{<br>  "ActiveDirectory-AllowADDSWebServices": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "9389",<br>    "AllowADDSWebServices"<br>  ],<br>  "ActiveDirectory-AllowADGCReplication": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "3268",<br>    "AllowADGCReplication"<br>  ],<br>  "ActiveDirectory-AllowADGCReplicationSSL": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "3269",<br>    "AllowADGCReplicationSSL"<br>  ],<br>  "ActiveDirectory-AllowADReplication": [<br>    "Inbound",<br>    "Allow",<br>    "*",<br>    "*",<br>    "389",<br>    "AllowADReplication"<br>  ],<br>  "ActiveDirectory-AllowADReplicationSSL": [<br>    "Inbound",<br>    "Allow",<br>    "*",<br>    "*",<br>    "636",<br>    "AllowADReplicationSSL"<br>  ],<br>  "ActiveDirectory-AllowADReplicationTrust": [<br>    "Inbound",<br>    "Allow",<br>    "*",<br>    "*",<br>    "445",<br>    "AllowADReplicationTrust"<br>  ],<br>  "ActiveDirectory-AllowDFSGroupPolicy": [<br>    "Inbound",<br>    "Allow",<br>    "Udp",<br>    "*",<br>    "138",<br>    "AllowDFSGroupPolicy"<br>  ],<br>  "ActiveDirectory-AllowDNS": [<br>    "Inbound",<br>    "Allow",<br>    "*",<br>    "*",<br>    "53",<br>    "AllowDNS"<br>  ],<br>  "ActiveDirectory-AllowFileReplication": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "5722",<br>    "AllowFileReplication"<br>  ],<br>  "ActiveDirectory-AllowKerberosAuthentication": [<br>    "Inbound",<br>    "Allow",<br>    "*",<br>    "*",<br>    "88",<br>    "AllowKerberosAuthentication"<br>  ],<br>  "ActiveDirectory-AllowNETBIOSAuthentication": [<br>    "Inbound",<br>    "Allow",<br>    "Udp",<br>    "*",<br>    "137",<br>    "AllowNETBIOSAuthentication"<br>  ],<br>  "ActiveDirectory-AllowNETBIOSReplication": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "139",<br>    "AllowNETBIOSReplication"<br>  ],<br>  "ActiveDirectory-AllowPasswordChangeKerberes": [<br>    "Inbound",<br>    "Allow",<br>    "*",<br>    "*",<br>    "464",<br>    "AllowPasswordChangeKerberes"<br>  ],<br>  "ActiveDirectory-AllowRPCReplication": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "135",<br>    "AllowRPCReplication"<br>  ],<br>  "ActiveDirectory-AllowSMTPReplication": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "25",<br>    "AllowSMTPReplication"<br>  ],<br>  "ActiveDirectory-AllowWindowsTime": [<br>    "Inbound",<br>    "Allow",<br>    "Udp",<br>    "*",<br>    "123",<br>    "AllowWindowsTime"<br>  ],<br>  "Cassandra": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "9042",<br>    "Cassandra"<br>  ],<br>  "Cassandra-JMX": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "7199",<br>    "Cassandra-JMX"<br>  ],<br>  "Cassandra-Thrift": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "9160",<br>    "Cassandra-Thrift"<br>  ],<br>  "CouchDB": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "5984",<br>    "CouchDB"<br>  ],<br>  "CouchDB-HTTPS": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "6984",<br>    "CouchDB-HTTPS"<br>  ],<br>  "DNS-TCP": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "53",<br>    "DNS-TCP"<br>  ],<br>  "DNS-UDP": [<br>    "Inbound",<br>    "Allow",<br>    "Udp",<br>    "*",<br>    "53",<br>    "DNS-UDP"<br>  ],<br>  "DynamicPorts": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "49152-65535",<br>    "DynamicPorts"<br>  ],<br>  "ElasticSearch": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "9200-9300",<br>    "ElasticSearch"<br>  ],<br>  "FTP": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "21",<br>    "FTP"<br>  ],<br>  "HTTP": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "80",<br>    "HTTP"<br>  ],<br>  "HTTPS": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "443",<br>    "HTTPS"<br>  ],<br>  "IMAP": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "143",<br>    "IMAP"<br>  ],<br>  "IMAPS": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "993",<br>    "IMAPS"<br>  ],<br>  "Kestrel": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "22133",<br>    "Kestrel"<br>  ],<br>  "LDAP": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "389",<br>    "LDAP"<br>  ],<br>  "MSSQL": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "1433",<br>    "MSSQL"<br>  ],<br>  "Memcached": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "11211",<br>    "Memcached"<br>  ],<br>  "MongoDB": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "27017",<br>    "MongoDB"<br>  ],<br>  "MySQL": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "3306",<br>    "MySQL"<br>  ],<br>  "Neo4J": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "7474",<br>    "Neo4J"<br>  ],<br>  "POP3": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "110",<br>    "POP3"<br>  ],<br>  "POP3S": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "995",<br>    "POP3S"<br>  ],<br>  "PostgreSQL": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "5432",<br>    "PostgreSQL"<br>  ],<br>  "RDP": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "3389",<br>    "RDP"<br>  ],<br>  "RabbitMQ": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "5672",<br>    "RabbitMQ"<br>  ],<br>  "Redis": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "6379",<br>    "Redis"<br>  ],<br>  "Riak": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "8093",<br>    "Riak"<br>  ],<br>  "Riak-JMX": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "8985",<br>    "Riak-JMX"<br>  ],<br>  "SMTP": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "25",<br>    "SMTP"<br>  ],<br>  "SMTPS": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "465",<br>    "SMTPS"<br>  ],<br>  "SSH": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "22",<br>    "SSH"<br>  ],<br>  "WinRM": [<br>    "Inbound",<br>    "Allow",<br>    "Tcp",<br>    "*",<br>    "5986",<br>    "WinRM"<br>  ]<br>}</pre> | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Network security group name | `string` | `"nsg"` | no |
| <a name="input_source_address_prefix"></a> [source\_address\_prefix](#input\_source\_address\_prefix) | Source address prefix to be applied to all predefined rules. list(string) only allowed one element (CIDR, `*`, source IP range or Tags). Example ["10.0.3.0/24"] or ["VirtualNetwork"] | `list(string)` | <pre>[<br>  "*"<br>]</pre> | no |
| <a name="input_source_address_prefixes"></a> [source\_address\_prefixes](#input\_source\_address\_prefixes) | Destination address prefix to be applied to all predefined rules. Example ["10.0.3.0/32","10.0.3.128/32"] | `list(string)` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | The tags to associate with your network security group. | `map(string)` | `{}` | no |
| <a name="input_tracing_tags_enabled"></a> [tracing\_tags\_enabled](#input\_tracing\_tags\_enabled) | Whether enable tracing tags that generated by BridgeCrew Yor. | `bool` | `false` | no |
| <a name="input_tracing_tags_prefix"></a> [tracing\_tags\_prefix](#input\_tracing\_tags\_prefix) | Default prefix for generated tracing tags | `string` | `"avm_"` | no |
| <a name="input_use_for_each"></a> [use\_for\_each](#input\_use\_for\_each) | Choose wheter to use 'for\_each' as iteration technic to generate the rules, defaults to false so we will use 'count' for compatibilty with previous module versions, but prefered method is 'for\_each' | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | The id of newly created network security group |
| <a name="output_network_security_group_name"></a> [network\_security\_group\_name](#output\_network\_security\_group\_name) | The name of newly created network security group |
<!-- END_TF_DOCS -->
=======
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tags to apply to the resource | `map(string)` | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
<!-- markdownlint-disable -->
<!-- prettier-ignore-end -->
>>>>>>> 43e5bd27807f12a9616fb6cc66e720743bdcaab7
