resource "heroku_addon" "postgres_basic" {
  app  = heroku_app.netbox.id
  plan = "heroku-postgresql:hobby-basic"

  lifecycle {
    prevent_destroy = true
  }
}

resource "heroku_addon" "redis" {
  app  = heroku_app.netbox.id
  plan = "heroku-redis:hobby-dev"

  lifecycle {
    prevent_destroy = true
  }
}
