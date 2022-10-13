variable "s3_endpoint" {
  type = string
}

variable "s3_access_key" {
  type = string
}

variable "s3_secret_key" {
  type = string
}

variable "vultr_api_key" {
  type = string
}

variable "github_runners_count" {
  type = number
  default = 0
}

variable "github_runners_region" {
  type = string
  default = "fra"
}

variable "github_runners_plan" {
  type = string
  default = "vhp-4c-8gb-intel"
}

variable "ansible_repo" {
  type = string
  default = "https://github.com/reinvented-stuff/tdlib-build"
}

variable "ssh_private_key" {
  type = string
  default = "id_rsa"
}

variable "ansible_repo_ref" {
  type = string
  default = "master"
}

variable "ansible_ghr_token" {
  type = string
  default = "dummy"
}
