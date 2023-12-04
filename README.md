# terraform-storage-sample-module

This is a sample Terraform module that only creates a single GCS bucket and is used for demonstration & test purposes.
<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | >= 4.5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 5.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.sample_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_force_destroy"></a> [enable\_force\_destroy](#input\_enable\_force\_destroy) | Set to true if deleting a bucket containing objects should not be blocked. | `bool` | `false` | no |
| <a name="input_enable_versioning"></a> [enable\_versioning](#input\_enable\_versioning) | True if versioning should be enabled. | `bool` | `true` | no |
| <a name="input_location"></a> [location](#input\_location) | Location where the bucket should be created in. | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the bucket. | `string` | n/a | yes |
| <a name="input_project_id"></a> [project\_id](#input\_project\_id) | ID of the project where the bucket should be created. | `string` | n/a | yes |
| <a name="input_public_access_prevention"></a> [public\_access\_prevention](#input\_public\_access\_prevention) | Acceptable values are "inherited" or "enforced". If "inherited", the bucket uses public access prevention. only if the bucket is subject to the public access prevention organization policy constraint. | `string` | `"inherited"` | no |
| <a name="input_retention_policy"></a> [retention\_policy](#input\_retention\_policy) | Object containing specs of retention policy of the bucket. retention\_period: The period of time, in seconds, that objects in the bucket must be retained and cannot be deleted, overwritten, or archived. The value must be less than 2,147,483,647 seconds. enable\_lock:  If set to true, the bucket will be locked and permanently restrict edits to the bucket's retention policy. Caution: Locking a bucket is an irreversible action. | <pre>object({<br>    retention_period = number<br>    enable_lock      = optional(bool, false)<br>  })</pre> | <pre>{<br>  "enable_lock": null,<br>  "retention_period": null<br>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_url"></a> [url](#output\_url) | URL of the bucket (e.g. gs://...). |
<!-- END_TF_DOCS -->