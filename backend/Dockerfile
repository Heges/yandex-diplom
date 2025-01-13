FROM golang:1.23 AS builder
WORKDIR /backend
COPY . .
RUN ls -lahh /backend \
    && ls -lahh cmd \
    && cd cmd/api/ \
    && go build -o momo-store .

FROM alpine:3.21
WORKDIR /app
COPY --from=builder /backend/cmd/api/momo-store .
EXPOSE 8081
ENTRYPOINT ["./momo-store"]