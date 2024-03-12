resource "google_storage_bucket" "bucket" {
  name = "tf-bucket-059782"
  location = "US"
  force_destroy = true
  uniform_bucket_level_access = true
}