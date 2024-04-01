# DEPRECATION NOTICE: This setup is no longer in use and will not be maintained

# Netbox Deployment on Heroku

Our Netbox deployment

Uses:
- [Netbox Official Docker Image](https://github.com/netbox-community/netbox-docker)
- [Heroku Docker Deployment](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml)
- Terraform for orchestration

## Contributing

Feel free to open a PR with your improvements. Terraform Cloud will run a plan on your changes.

## Developing

You can run a speculative remote plan from your CLI if you're logged into Terraform Cloud: `terraform plan`

## License

See [license note](LICENSE.md).
