# Netbox Deployment on Heroku

Our Netbox deployment

Uses:
- [Netbox Official Docker Image](https://github.com/netbox-community/netbox-docker)
- [Heroku Docker Deployment](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml)
- Terraform for orchestration

## Contributing

Feel free to open a PR with your improvements. Terraform Cloud will run a plan on your changes.

## Developing

Due to [a bug in the Heroku Terraform provider](https://github.com/heroku/terraform-provider-heroku/issues/272) we need to check a tar archive of the deployment artifact into git and update it whenever we make changes. This might go away once the bug is fixed.

On _macOS_ please install GNU Tar:
```sh
brew install gnu-tar
```

Run this **whenever making changes to `modules/netbox-heroku/config`**:

```sh
./generate.sh
```

## License

See [license note](LICENSE.md).
