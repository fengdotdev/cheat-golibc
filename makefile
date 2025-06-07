


# native c library
PATH_MYMATH = ./nativeclib/mymath/mymath.c

# go library for c
PATH_ECHOLIBC = ./golibc/ui/echolibc/echolibc.go

OUT_MYMATH = libmymath
OUT_ECHOLIBC = libecho

OUTPUT_DIR = ./outputs

LIBC_FOLDER = libc

# runners
CPATH = examples/c

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
	cd golibc
	go mod tidy
	go mod vendor
	go mod verify
	

# update the go.mod file with the latest dependencies
get:
	cd golibc
	go get $(TRAITS)@latest
	go get $(TESTING)@latest



# run all tests
test:
	cd golibc
	go clean -testcache
	go test -count=1 -v ./...



build:	clearOutput  buildlinux copyout

clearOutput:
	rm -rf ${OUTPUT_DIR}/*
	mkdir -p ${OUTPUT_DIR}



copyout:
# copy the contents of the output directory to the bunlibc folder

# bun
	cp -r ${OUTPUT_DIR}/. ${BUNPATH}/${LIBC_FOLDER}
# c
	cp -r ${OUTPUT_DIR}/. ${CPATH}/${LIBC_FOLDER}

# Run examples -------------------------------------------------------------------------------------

bun:
	cd ${BUNPATH} && bun run index.ts

c:
	cd ${CPATH} && ./main

# Build libc libraries 

# in linux 
buildlinux: build_echo_linux build_mymath_linux

# for building the c library my math 
build_mymath_linux: 
	gcc -shared -fPIC -o ${OUTPUT_DIR}/${OUT_MYMATH}.so ${PATH_MYMATH}
	
# for building the go library echo
build_echo_linux:
	cd golibc
	go build -o ${OUTPUT_DIR}/${OUT_ECHOLIBC}.so -buildmode=c-shared ${PATH_ECHOLIBC}



