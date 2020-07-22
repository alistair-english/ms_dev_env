.PHONY: build_local build_jetson run_local

export HOST_USER=$(USER)
export HOST_UID=$(shell id -u)

all:
	@echo Hi!
	@echo Check the Makefile for commands you can run :)

build:
	docker-compose build ros

run:
	docker-compose run ros

run_core:
	docker-compose up -d core
