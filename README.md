# hardened-nginx

[![CircleCI](https://circleci.com/gh/sirech/hardened-nginx.svg?style=svg)](https://circleci.com/gh/sirech/hardened-nginx)

This is a hardened nginx image that provides sane defaults and allows templating through gomplate.

[nginx](https://www.nginx.com/) is an amazing little piece of software. I've been using it for years to run my applications. It's also not the easiest thing to configure. This [Docker](https://www.docker.com/) image is intended to make it easier to run it using good practices.

## How to use it

## Development

There is a `go` script for development. When run without parameters, it shows the different targets.

There is a test suite based on [ServerSpec](https://serverspec.org/). To run it, do

```
./go containerize
./go test-container
```

## Architecture

### Hardening

The inspiration for the settings comes from a bunch of different sources:

- [Securing DevOps](https://www.manning.com/books/securing-devops).
- https://github.com/h5bp/server-configs-nginx
