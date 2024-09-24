# Alpine 3.20
FROM golang:1.23.1-alpine3.20
RUN apk add --no-cache zip

# copy entrypoint file
COPY entrypoint.go /usr/bin/entrypoint.go

# change mode of the entrypoint file
RUN chmod +x /usr/bin/entrypoint.go

RUN CGO_ENABLED=0 GOOS=${TARGETOS} GOARCH=${TARGETARCH} go build -o /go-xbuild

# set entrypoint command
ENTRYPOINT [ "/go-xbuild"]
