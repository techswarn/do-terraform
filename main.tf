resource "digitalocean_app" "laravel-sample" {
  spec {
    name   = "laravel-sample"
    region = "ams"

    service {
      name               = "laravel"
      environment_slug   = "php"
      instance_count     = 1
      instance_size_slug = "professional-xs"

      git {
        repo_clone_url = "https://github.com/techswarn/bradtraversy-laravel-sample"
        branch         = "main"
      }
    }

    database {
      name       = "db-mysql-blr"
      cluster_name = "db-mysql-blr"
      engine     = "MYSQL"
      production = true
    }
  }
}