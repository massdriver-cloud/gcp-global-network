module "apis" {
  source = "github.com/massdriver-cloud/terraform-modules//gcp-enable-apis?ref=a1b2019"
  services = [
    "cloudresourcemanager.googleapis.com",
    "compute.googleapis.com",
    "servicenetworking.googleapis.com",
    "serviceusage.googleapis.com"
  ]
}
