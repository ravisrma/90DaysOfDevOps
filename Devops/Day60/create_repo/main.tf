resource "github_repository" "repo1" {
    name        = var.repository_name[0]
    description = var.repository_description_1
    visibility = "public"
    auto_init = true
}
resource "github_repository" "repo2" {
    name        = var.repository_name[1]
    description = var.repository_description_2
    visibility = "public"
    auto_init = true 
}