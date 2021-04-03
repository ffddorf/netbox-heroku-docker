resource "heroku_addon" "postgres" {
  app  = heroku_app.netbox.id
  plan = "heroku-postgresql:hobby-dev"
}

resource "heroku_addon" "redis" {
  app  = heroku_app.netbox.id
  plan = "heroku-redis:hobby-dev"
}
