# Example on how to invoke this module.

# provider config
terraform {
  required_version = "~> 1.5.2"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.0.0"
    }
  }
}


# module invocation
module "my_bucket" {
  source = "./.."

  name                 = "my-unique-bucket-super-test"
  project_id           = "PROJECT_ID"
  location             = "europe-central2"
  enable_force_destroy = true
  enable_versioning    = false
  retention_policy = {
    retention_period = 10
  }
}