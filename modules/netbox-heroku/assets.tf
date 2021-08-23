resource "google_storage_bucket" "assets" {
  name     = "ffddorf-netbox-assets"
  location = "europe-west3"
}

resource "google_service_account" "asset-access" {
  account_id   = "netbox-asset-access"
  display_name = "Netbox Asset Access"
}

resource "google_storage_bucket_iam_member" "asset-access" {
  bucket = google_storage_bucket.assets.name
  role   = "roles/storage.editor"
  member = "serviceAccount:${google_service_account.asset-access.email}"
}

resource "google_service_account_key" "asset-access-key" {
  service_account_id = google_service_account.asset-access.name
}

