VERSION = 0.0.1


MODULE_NAME := github.com/fengdotdev/cheat-golibc
# native c library
PATH_MYMATH := ./libc/mymath/mymath.c

# go library for c
PATH_ECHOLIBC := ./ui/echolibc/echolibc.go

# Core Libraries -------------------------------------------------------------------------------------

# Traits: Library for handling reusable traits (interfaces) in Go. <DEVELOPMENT>
TRAITS = github.com/fengdotdev/golibs-traits
# Testing: Library for testing utilities in Go. <STABLE>
TESTING = github.com/fengdotdev/golibs-testing


.PHONY: sand init  fix get tag test playground sandbox examples vo_folder

sand: 
	go run cmd/playground/main.go





fix:	
# fix the go.mod file
	go mod tidy
	go mod vendor
	go mod verify
	

# update the go.mod file with the latest dependencies
get:
	go get $(TRAITS)@latest
	go get $(TESTING)@latest

# update the version of the project
tag:
		git tag v${VERSION} && git push origin v${VERSION}

# run all tests
test:
	go clean -testcache
	go test -count=1 -v ./...








# Build libc libraries 



# in linux 

# for building the c library my math 
buildC_mymathLinux:

	


buildlinux:
	GOOS=linux GOARCH=amd64 go build -o bin/libc.so -buildmode=c-shared ./libc



