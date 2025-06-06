package main

import "C"

import "github.com/fengdotdev/cheat-golibc/echo"

//export EchoString
func EchoString(s *C.char) *C.char {
	in := C.GoString(s)

	result := echo.EchoString(in)
	return C.CString(result)
}

func main() {
	// This is just a placeholder to ensure the package is compiled.
	// The actual functionality is provided by the exported functions.
}
