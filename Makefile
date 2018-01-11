# ============================================================
#  Author: Chu-Siang Lai / chusiang (at) drx.tw
#  Blog: http://note.drx.tw
#  Filename: Makefile
#  Modified: 2016-11-30 12:51
#  Description: Do something with make.
# =========================================================== 

.PHONY: main pull run start stop clean retag_latest

main: run

# Only download the docker image.
pull:
	docker pull chusiang/ansible-jupyter:alpine-3.4
	docker pull chusiang/ansible-managed-node:alpine-3.4
	docker pull chusiang/ansible-managed-node:centos-7
	docker pull chusiang/ansible-managed-node:debian-8
	docker pull chusiang/ansible-managed-node:ubuntu-14.04

# Run containers.
run:
	docker-compose up

# Start containers.
start:
	docker-compose start

# Stop containers.
stop:
	docker-compose stop

# Remove containers.
clean:
	docker-compose rm -f

# Retag and push the latest tag.
retag_latest:
	-sh bin/retag_latest.sh

