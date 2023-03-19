resource "heroku_addon" "postgres_basic" {
  app  = heroku_app.netbox.id
  plan = "heroku-postgresql:basic"

  lifecycle {
    prevent_destroy = true
  }
}

resource "heroku_addon" "redis" {
  app  = heroku_app.netbox.id
  plan = "heroku-redis:mini"

  lifecycle {
    prevent_destroy = true
  }
}
