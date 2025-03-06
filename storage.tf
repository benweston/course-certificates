resource "google_storage_bucket" "terraform_state" {
  name          = "terraform-state-${random_integer.randomised_suffix.result}"
  location      = var.region
  storage_class = "STANDARD"

  retention_policy {
    retention_period = 604800
  }

  versioning {
    enabled = true
  }

  uniform_bucket_level_access = true
  public_access_prevention    = "enforced"

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      num_newer_versions = 3
    }
  }

  lifecycle_rule {
    action {
      type = "Delete"
    }
    condition {
      age = 7
    }
  }

  depends_on    = [module.project-factory]
  force_destroy = false

}

resource "google_storage_bucket" "github_pdfs" {
  default_event_based_hold    = false
  enable_object_retention     = false
  force_destroy               = false
  location                    = var.region
  name                        = "github-pdfs-358041"
  project                     = "${var.project_id_prefix}-${random_integer.randomised_suffix.result}"
  public_access_prevention    = "inherited"
  requester_pays              = false
  uniform_bucket_level_access = false

  hierarchical_namespace {
    enabled = false
  }

  lifecycle_rule {
    action {
      storage_class = null
      type          = "Delete"
    }
    condition {
      age                                     = 0
      created_before                          = null
      custom_time_before                      = null
      days_since_custom_time                  = 0
      days_since_noncurrent_time              = 0
      matches_prefix                          = []
      matches_storage_class                   = []
      matches_suffix                          = []
      noncurrent_time_before                  = null
      num_newer_versions                      = 3
      send_age_if_zero                        = false
      send_days_since_custom_time_if_zero     = false
      send_days_since_noncurrent_time_if_zero = false
      send_num_newer_versions_if_zero         = false
      with_state                              = "ARCHIVED"
    }
  }
  lifecycle_rule {
    action {
      storage_class = null
      type          = "Delete"
    }
    condition {
      age                                     = 0
      created_before                          = null
      custom_time_before                      = null
      days_since_custom_time                  = 0
      days_since_noncurrent_time              = 7
      matches_prefix                          = []
      matches_storage_class                   = []
      matches_suffix                          = []
      noncurrent_time_before                  = null
      num_newer_versions                      = 0
      send_age_if_zero                        = false
      send_days_since_custom_time_if_zero     = false
      send_days_since_noncurrent_time_if_zero = false
      send_num_newer_versions_if_zero         = false
      with_state                              = "ANY"
    }
  }

  soft_delete_policy {
    retention_duration_seconds = 604800
  }

  versioning {
    enabled = true
  }
}
