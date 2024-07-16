# This Terraform configuration file specifies the required version of Terraform and the required providers.
# The required version of Terraform is set to ">= 1.2".
# The required provider is "azurerm" with a minimum version of ">= 1.32".
terraform {
  required_version = ">= 1.2"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 1.32"
    }

    citrix = {
      source  = "citrix/citrix"
      version = ">=0.6.1"
    }

  }
}
