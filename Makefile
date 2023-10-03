IMAGE ?= cilium/starwars	

# Build a local image. Docker engine currently only supports images with a
# single platform 
.PHONY: build 
build:
	docker build --tag $(IMAGE) .

# For pushing to a remote registry (e.g. Docker Hub) build a multi-platform image
.PHONY: publish 
publish:
	@docker buildx create --use --name=crossplatform --node=crossplatform && \
	docker buildx build \
		--platform linux/amd64,linux/arm64 \
		--output "type=image,push=true" \
		--tag $(IMAGE) .