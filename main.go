package main

import (
	"fmt"

	"github.com/CloudReady-club/repo_b/hello"
	"github.com/CloudReady-club/repo_c/weather"
)

func main() {
	a:= hello.SayHello()
	b:= weather.GetTemperature()

	fmt.Println(a)
	fmt.Println(b)
}