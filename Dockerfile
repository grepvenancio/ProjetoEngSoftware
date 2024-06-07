FROM golang:1.22

WORKDIR /app

ENV GO111MODULE=on

RUN go install github.com/mailhog/MailHog@latest
RUN go install github.com/a-h/templ/cmd/templ@latest
RUN go install github.com/air-verse/air@latest

COPY go.mod go.sum ./ 

RUN go mod download

COPY . .

RUN make build

EXPOSE 8080 8025

CMD ["sh", "-c", "mailhog & air"]
