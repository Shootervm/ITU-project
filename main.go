package main

import "github.com/labstack/echo"

func main() {
	// environment
	port := "8888"
	bind := "0.0.0.0"

	e := echo.New()
	route(e)

	e.Run(bind + ":" + port)
}

// route will establish routes
func route(e *echo.Echo) {

	e.Static("/", "static")

	//api := e.Group("/api")
}
