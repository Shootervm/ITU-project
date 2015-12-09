package main

import (
	"fmt"
	"os"

	"github.com/labstack/echo"
)

func main() {
	port := "80"
	bind := ""

	// retrieve specific port
	if eport := os.Getenv("port"); eport != "" {
		port = eport
	}
	// retrieve specific bind address
	if ebind := os.Getenv("bind"); ebind != "" {
		bind = ebind
	}

	e := echo.New()
	route(e)

	fmt.Println("Starting server on http://" + bind + ":" + port + "/")

	e.Run(bind + ":" + port)
}

// route will establish routes
func route(e *echo.Echo) {

	e.Static("/", "static")

	//api := e.Group("/api")
}
