terraform {
  backend "s3" {

    bucket = "tdlib"
    key = "terraform.tfstate"

    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_region_validation = true
    force_path_style = true
  }
}