.PHONY: build assets all gen deps

all: deps assets build install

deps:
	go get && go get github.com/GeertJohan/go.rice/rice

build:
	go build -v -o ./h2c .

assets:
	cd cmd && rice embed-go

gen: all
	./h2c generate examples/charts/fluent-bit

install:
	cp ./h2c /usr/local/bin/h2c
