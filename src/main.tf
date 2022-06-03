resource "google_compute_network" "main" {
  name                    = var.md_metadata.name_prefix
  routing_mode            = "GLOBAL"
  auto_create_subnetworks = false

  depends_on = [
    module.apis
  ]
}

// Allocate a specific IP address for "Private Service Connect" so we can access Google API's privately
// https://cloud.google.com/vpc/docs/configure-private-service-connect-apis
resource "google_compute_global_address" "private_service_connect" {
  name         = "${var.md_metadata.name_prefix}-psconnect"
  address_type = "INTERNAL"
  purpose      = "PRIVATE_SERVICE_CONNECT"
  network      = google_compute_network.main.id
  address      = var.private_service_connect_ip
}

resource "google_compute_global_forwarding_rule" "private_service_connect" {
  name                  = "psconnect"
  target                = "all-apis"
  network               = google_compute_network.main.id
  ip_address            = google_compute_global_address.private_service_connect.address
  load_balancing_scheme = ""

  depends_on = [
    module.apis
  ]
}

locals {
  private_services_access_ip   = split("/", var.private_services_access_cidr)[0]
  private_services_access_mask = split("/", var.private_services_access_cidr)[1]
}
// Allocate a range for "Private Services Access" so we can launch GCP services without individual peering connections
// https://cloud.google.com/vpc/docs/private-services-access
resource "google_compute_global_address" "google_services" {
  name          = "${var.md_metadata.name_prefix}-services"
  address_type  = "INTERNAL"
  purpose       = "VPC_PEERING"
  network       = google_compute_network.main.id
  address       = local.private_services_access_ip
  prefix_length = local.private_services_access_mask
}

// This resource requires "roles/servicenetworking.networksAdmin", which isn't in the "Editor" role
resource "google_service_networking_connection" "google_services" {
  network                 = google_compute_network.main.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.google_services.name]
}
