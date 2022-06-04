module "apis" {
  source = "github.com/massdriver-cloud/terraform-google-enable-apis"
  services = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
  ]
}
