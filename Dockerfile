FROM golang:1.6-onbuild
LABEL maintainer "Thomas Graf <tgraf@tgraf.ch>"
ENTRYPOINT ["/go/bin/app", "--port", "80", "--host", "0.0.0.0"]
