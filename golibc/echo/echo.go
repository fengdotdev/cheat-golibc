package echo

import "fmt"

// Echo functions for various types.

// EchoString echoes a string.
func EchoString(s string) string {
	return fmt.Sprintf("Echoed from go: %s", s)
}

// EchoInt echoes an int.
func EchoInt(i int) int {
	return i
}

// EchoFloat64 echoes a float64.
func EchoFloat64(f float64) float64 {
	return f
}

// EchoBool echoes a bool.
func EchoBool(b bool) bool {
	return b
}

// EchoByteSlice echoes a byte slice.
func EchoBytes(b []byte) []byte {
	return b
}
