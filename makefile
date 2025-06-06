VERSION = 0.0.1


MODULE_NAME = github.com/fengdotdev/cheat-golibc
# native c library
PATH_MYMATH = ./nativeclib/mymath/mymath.c

# go library for c
PATH_ECHOLIBC = ./ui/echolibc/echolibc.go

OUT_MYMATH = libmymath
OUT_ECHOLIBC = libecho

OUTPUT_DIR = ./outputs

BUNPATH = examples/javascript/bunlibc

# Core Libraries -------------------------------------------------------------------------------------

# Traits: Library for handling reusable traits (interfaces) in Go. <DEVELOPMENT>
TRAITS = github.com/fengdotdev/golibs-traits
# Testing: Library for testing utilities in Go. <STABLE>
TESTING = github.com/fengdotdev/golibs-testing


.PHONY: sand init  fix get tag test playground sandbox examples build build_echo_linux

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



build:	clearOutput  buildlinux

clearOutput:
	rm -rf ${OUTPUT_DIR}/*
	mkdir -p ${OUTPUT_DIR}


bun:
	cd ${BUNPATH} && bun run index.ts

# Build libc libraries 

# in linux 
buildlinux: build_echo_linux build_mymath_linux

# for building the c library my math 
build_mymath_linux: 
	gcc -shared -fPIC -o ${OUTPUT_DIR}/${OUT_MYMATH}.so ${PATH_MYMATH}
	
# for building the go library echo
build_echo_linux:
	go build -o ${OUTPUT_DIR}/${OUT_ECHOLIBC}.so -buildmode=c-shared ${PATH_ECHOLIBC}



