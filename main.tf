resource "google_storage_bucket" "sample_bucket" {
  name     = var.name
  project  = var.project_id
  location = var.location

  force_destroy               = var.enable_force_destroy
  uniform_bucket_level_access = true
  public_access_prevention    = var.public_access_prevention

  dynamic "retention_policy" {
    for_each = var.retention_policy.retention_period != null ? ["dummy"] : []

    content {
      is_locked        = var.retention_policy.enable_lock
      retention_period = var.retention_policy.retention_period
    }
  }

  versioning {
    enabled = var.enable_versioning
  }

  labels = {
    module-version: "v1-1"
  }
}
