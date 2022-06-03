module "apis" {
  source = "../../../provisioners/terraform/modules/gcp-apis"
  services = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
  ]
}
