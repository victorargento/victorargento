# Construimos el binario en la imagen que contiene Go.
FROM golang:1.17 as build-env

WORKDIR /go/src/app
COPY *.go ./

RUN go mod init
RUN go get -d -v ./...
RUN go vet -v
RUN go test -v

RUN CGO_ENABLED=0 go build -o /go/bin/app

# Copiamos el binario desde BUILD-ENV a la imagen Distroless.
# En este caso utilizaremos la imagen static, que contiene las dependencias mínimas,
# si nuestra aplicación depende de paquetes como glibc, libssl o openssl utilizaremos la imagen base
# FROM gcr.io/distroless/base
FROM gcr.io/distroless/static
USER nonroot:nonroot

COPY --from=build-env --chown=nonroot:nonroot /go/bin/app /
CMD ["/app"]