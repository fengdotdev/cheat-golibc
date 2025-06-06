package main

import (
	"fmt"

	"github.com/fengdotdev/cheat-golibc/echo"
)

func main() {

	myString := "Hello, World!"
	result := echo.EchoString(myString)
	fmt.Printf("Echoed String: %s\n", result)

}
