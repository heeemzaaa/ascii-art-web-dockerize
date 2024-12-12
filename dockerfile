# Stage 1: Build the Go backend
FROM debian:bullseye-slim AS builder

# Adding metadata
LABEL maintainer="Zone01 talents(helkhawl, yfawziya, tsaadal)"
LABEL version="1.0.0"
LABEL description="An image to run the ASCII Art Web application."
LABEL website="http://localhost:8080"
LABEL build-date="December 2024"

# Install Go
RUN apt-get update && apt-get install -y golang-go

WORKDIR /app

# Copy the source code
COPY backend /app/backend

# Build the Go binary
RUN cd backend && go build -o /app/ascii-art-web main.go

# Stage 2: Use Debian Bullseye for runtime
FROM debian:bullseye-slim

WORKDIR /app

# Copy the built binary
COPY --from=builder /app/ascii-art-web /app/ascii-art-web

# Copy required directories
COPY backend/internal/art /app/internal/art
COPY templates /app/templates
COPY static /app/static

# Expose the port for the Go server
EXPOSE 8080

# Command to run the Go server
CMD ["./ascii-art-web"]
