module "apis" {
  source = "github.com/massdriver-cloud/terraform-modules//gcp-enable-apis?ref=c336d59"
  services = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com"
  ]
}
