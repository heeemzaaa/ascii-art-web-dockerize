FROM golang:1.22.3

WORKDIR /dockerize

LABEL maintainer="Zone01 talents(helkhawl, yfawziya, tsaadal)"

COPY . .

RUN go build -o . main.go

CMD [ "go","run","." ]

