resource "digitalocean_app" "vite-sample" {
  spec {
    name   = "titan"
    region = "ams"

    service {
      name               = "titan"
      instance_count     = 1
      instance_size_slug = "professional-xs"
      http_port = "3000"

      image {
        registry_type = "DOCR"
        repository = "titan"
        tag = "latest"
        deploy_on_push {
          enabled = "true"
        }
      }
    }
  }
}
