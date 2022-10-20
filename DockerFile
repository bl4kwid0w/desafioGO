FROM golang:alpine3.14 as builder

WORKDIR /app
COPY . .
RUN go build -o /main main.go

## Deploy
## scratch the image for use minimoun size to fit in 2MB especified on the course 
FROM scratch

WORKDIR /
COPY --from=builder /main /main
EXPOSE 8080
ENTRYPOINT ["/main"]