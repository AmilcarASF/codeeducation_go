FROM golang:1.16-alpine AS builder
WORKDIR /go/src/fullCycle
COPY go/main.go .
RUN go mod init main && \
    go build && \
    go install

FROM scratch AS runtime
WORKDIR /tmp
COPY --from=builder /go/bin/main .
CMD ["/tmp/main"]