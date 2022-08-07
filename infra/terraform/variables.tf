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
  default = "vhp-2c-2gb-intel"
}

variable "ansible_repo" {
  type = string
  default = "https://github.com/reinvented-stuff/tdlib-build"
}

variable "ansible_repo_ref" {
  type = string
  default = "dev"
}
