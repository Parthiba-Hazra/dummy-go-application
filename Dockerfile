FROM golang:1.18-bullseye

RUN go install github.com/beego/bee/v2@latest

ENV APP_HOME /go/src/go_movie_crud

RUN mkdir -p "$APP_HOME"

WORKDIR "$APP_HOME"

COPY . .

RUN go mod init

RUN go get -u github.com/gorilla/mux

EXPOSE 8000

CMD ["bee", "run"]