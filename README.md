# starwars-docker
Deathstar as a Service

## Build and publish

Build a Docker container locally with `make build`.

Build and push to a registry with `make publish`. You can specify the image tag with the env var `IMAGE` (defaults to `cilium/starwars`)

## Set custom landing response msg
Set the `LANDING_RESPONSE_MSG` environment variable to override default landing request response message string.

## Enable landing service redirect
Set the `LANDING_REQUEST_URL` environment variable to redirect landing request to different location. 
 
