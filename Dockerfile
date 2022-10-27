# Start from golang base image
FROM golang:alpine AS go_builder

# Install git.
# Git is required for fetching the dependencies.
RUN apk update && apk add --no-cache git && apk add --no-cach bash && apk add build-base

# Setup folders
WORKDIR /app

# Copy the source from the current directory to the working Directory inside the container
COPY . .
#COPY .env .

# Download all the dependencies
RUN go get -d -v ./...

# Install the package
RUN go install -v ./...

# Build the Go app
RUN go build -o /vidby_api


FROM alpine:3.16 AS final

WORKDIR /app

RUN apk update --no-cache && \
    apk add coreutils && \
    rm -rf /var/cache/apk/*
    
# copy binary file from build stage
COPY --from=go_builder vidby_api ./vidby_api

# copy content inside docker image
COPY ./content ./content

# Expose port 8080 to the outside world
EXPOSE 8080

# Run the executable
CMD [ "./vidby_api" ]
