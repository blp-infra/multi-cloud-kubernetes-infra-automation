# Configure the AWS Provider
provider "aws" {
  region = "ap-south-2"
}
# Google Cloud provider
provider "google" {
  project     = "zeta-flare-449207-r0"
  region      = "asia-south1"
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  resource_provider_registrations = "none" # This is only required when the User, Service Principal, or Identity running Terraform lacks the permissions to register Azure Resource Providers.
  features {}
}