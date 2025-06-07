package main

import "C"

import (
	"unsafe"

	"github.com/fengdotdev/cheat-golibc/golibc/echo"
)

//export EchoString
func EchoString(s *C.char) *C.char {
	in := C.GoString(s)

	result := echo.EchoString(in)
	return C.CString(result)
}

//export EchoInt
func EchoInt(i C.int) C.int {
	result := echo.EchoInt(int(i))
	return C.int(result)
}

// EchoByte
// func EchoByte(ptr unsafe.Pointer, n C.int) (unsafe.Pointer, C.int) {
// 	in := C.GoBytes(ptr, n)
// 	result := echo.EchoBytes(in) // Assuming this function returns a []byte
// 	out := C.CBytes(result)
// 	return unsafe.Pointer(out), C.int(len(result))
// }


//export EchoBytes
func EchoBytes(inputPtr unsafe.Pointer, inputSize C.int, outputSize *C.int) unsafe.Pointer {
	// Convertir input de C a Go
	input := C.GoBytes(inputPtr, inputSize)

	// Procesar con tu función Go
	result := echo.EchoBytes(input)

	// Escribir el tamaño de salida en el parámetro de salida
	*outputSize = C.int(len(result))

	// Allocar memoria C y copiar el resultado
	output := C.CBytes(result)

	return output
}


func main() {
	// This is just a placeholder to ensure the package is compiled.
	// The actual functionality is provided by the exported functions.
}
