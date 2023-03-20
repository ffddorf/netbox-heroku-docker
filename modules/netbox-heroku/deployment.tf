resource "heroku_build" "netbox" {
  app_id = heroku_app.netbox.id

  source {
    path = "${path.module}/config/"
  }
}

resource "heroku_formation" "netbox_web" {
  app_id     = heroku_app.netbox.id
  type       = "web"
  quantity   = 1
  size       = "basic"
  depends_on = [heroku_build.netbox]
}

resource "heroku_formation" "netbox_worker" {
  app_id     = heroku_app.netbox.id
  type       = "worker"
  quantity   = 1
  size       = "basic"
  depends_on = [heroku_build.netbox]
}
