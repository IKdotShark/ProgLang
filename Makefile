# All u need for this repo
# Use comand `make install` to use it
# Can be used for old Linux versions (apt-get)

install:
	sudo apt-get update
	sudo apt-get install gcc flex bison

.PHONY: install
