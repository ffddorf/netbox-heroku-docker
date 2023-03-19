resource "heroku_build" "netbox" {
  app = heroku_app.netbox.id

  source {
    path = "${path.module}/config.tar.gz"
  }
}

resource "heroku_formation" "netbox_web" {
  app        = heroku_app.netbox.id
  type       = "web"
  quantity   = 1
  size       = "basic"
  depends_on = [heroku_build.netbox]
}

resource "heroku_formation" "netbox_worker" {
  app        = heroku_app.netbox.id
  type       = "worker"
  quantity   = 1
  size       = "basic"
  depends_on = [heroku_build.netbox]
}
