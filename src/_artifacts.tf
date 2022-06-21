
resource "massdriver_artifact" "network" {
  field                = "network"
  provider_resource_id = google_compute_network.main.id
  specification_path   = "../massdriver.yaml"
  name                 = "Global Network ${var.md_metadata.name_prefix} (${google_compute_network.main.id})"
  artifact = jsonencode(
    {
      data = {
        grn = google_compute_network.main.id
        private_services_access = {
          name = google_compute_global_address.google_services.name
          cidr = "${google_compute_global_address.google_services.address}/${google_compute_global_address.google_services.prefix_length}"
        }
        private_service_connect_ip = google_compute_global_address.private_service_connect.address
      }
      specs = {
        gcp = {
          project  = google_compute_network.main.project
          service  = "compute"
          resource = "network"
        }
      }
    }
  )
}
