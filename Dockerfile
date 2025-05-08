# BUILDER
FROM --platform=${BUILDPLATFORM:-linux/amd64} golang:1.24 as builder

ARG TARGETPLATFORM
ARG TARGETOS
ARG TARGETARCH

WORKDIR /app
ADD . .
RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build

# RUNTIME
FROM --platform=${TARGETPLATFORM:-linux/amd64} scratch
COPY --from=builder /app/starwars-docker /
EXPOSE 80
ENTRYPOINT ["/starwars-docker", "--port", "80", "--host", "0.0.0.0"]
