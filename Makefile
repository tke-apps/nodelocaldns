SHELL := /bin/bash

all: yaml install

install: 
	kubectl apply -f nodelocaldns.yaml

yaml:
	./generate-yaml.sh
