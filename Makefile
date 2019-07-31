# =============================================================================
#  Author: Chu-Siang Lai / chusiang (at) drx.tw
#  Blog: http://note.drx.tw
#  Filename: Makefile
#  Modified: 2019-08-01 00:13
#  Description: Do something with make.
# =============================================================================

.PHONY: main check syntax_check lint_check yaml_check	\
	pull run start stop retag_latest		\
	clean

main: check

# - Check ---------------------------------------------------------------------

check: syntax_check lint_check yaml_check

syntax_check:
	ansible-playbook --syntax-check setup*.yml

lint_check:
	ansible-lint setup*.yml

yaml_check:
	find -name "*.yml" -type f -exec yamllint -c .yamllint.yaml {} \;

# - Docker --------------------------------------------------------------------

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

# Retag and push the latest tag.
retag_latest:
	-sh bin/retag_latest.sh

# - Clean ---------------------------------------------------------------------

clean:
	# Remove containers.
	docker-compose rm -f
