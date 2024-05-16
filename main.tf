resource "digitalocean_app" "laravel-sample" {
  spec {
    name   = "laravel-sample-new"
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

# Create firewall rule for database replica
# Force database firewall provisioning after app creation
resource "digitalocean_database_firewall" "db_firewall" {
cluster_id = "79219163-4d0d-4781-bd77-e07633e3e3f8"

rule {
  type = "app"
  value = digitalocean_app.laravel-sample.id
}
}