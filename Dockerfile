# Start by building the application.
FROM golang:1.19-alpine as build

WORKDIR /go/src/app
COPY . .
RUN adduser -S -u 1001 gouser && \
	go mod download && \
	CGO_ENABLED=0 go build -o /go/bin/app.bin cmd/main.go
 
FROM scratch
COPY --from=build /etc/passwd /etc/passwd
COPY --from=build /go/bin/app.bin /app.bin
COPY --from=build --chown=1001 /go/src/app/upload /uploads
USER gouser
VOLUME [ "/uploads" ]
CMD ["/app.bin"]
EXPOSE 9999