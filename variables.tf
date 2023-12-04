variable "name" {
  description = "Name of the bucket."
  type        = string
}

variable "project_id" {
  description = "ID of the project where the bucket should be created."
  type        = string
}

variable "location" {
  description = "Location where the bucket should be created in."
  type        = string
}

variable "enable_force_destroy" {
  description = "Set to true if deleting a bucket containing objects should not be blocked."
  type        = bool
  default     = false
}

variable "public_access_prevention" {
  description = "Acceptable values are \"inherited\" or \"enforced\". If \"inherited\", the bucket uses public access prevention. only if the bucket is subject to the public access prevention organization policy constraint."
  type        = string
  default     = "inherited"
  validation {
    condition     = can(regex("(^inherited$)|(^enforced$)", var.public_access_prevention))
    error_message = "Acceptable values for public_access_prevention property are \"inherited\" or \"enforced\"."
  }
}

variable "enable_versioning" {
  description = "True if versioning should be enabled."
  type        = bool
  default     = true
}

variable "retention_policy" {
  description = "Object containing specs of retention policy of the bucket. retention_period: The period of time, in seconds, that objects in the bucket must be retained and cannot be deleted, overwritten, or archived. The value must be less than 2,147,483,647 seconds. enable_lock:  If set to true, the bucket will be locked and permanently restrict edits to the bucket's retention policy. Caution: Locking a bucket is an irreversible action."
  type = object({
    retention_period = number
    enable_lock      = optional(bool, false)
  })
  default = {
    retention_period = null
    enable_lock      = null
  }
  validation {
    condition     = can(var.retention_policy.retention_period < 2147483647) || var.retention_policy.retention_period == null
    error_message = "Retention period property (retention_period) must be less than 2147483647 seconds."
  }
}