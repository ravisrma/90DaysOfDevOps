variable "github_token" {
  description = "GitHub token"
  type = string
}
variable "repository_name" {
  type = list(string)
}
variable "repository_description_1" {
    //description = "This is my new repository created using Terraform"
    type = string
    default = ""
}
variable "repository_description_2" {
    //description = "This is my new repository created using Terraform"
    type = string
    default = ""
}

