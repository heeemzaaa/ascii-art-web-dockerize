FROM golang:1.22.3

WORKDIR /dockerize

COPY . .

RUN go build -o . main.go

CMD [ "go","run","." ]

