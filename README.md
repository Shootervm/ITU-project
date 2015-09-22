# Material APP

Is a template application with prepared components for an easy to use and quick new Golang/Angular/Material web.

## Requirements

* [Node.js and npm](nodejs.org)
* [Golang](golang.org)
* [Bower](bower.io)

## Creating the app

Clone the repo:
`git clone git@github.com:flowup/material-app.git myApp`

Install golang dependencies:
`go get ./...`

Install npm dependencies(grunt)
`npm install`

## Writing the app

`grunt`
- performs all necessary setup operations (just once)
  - compiles the scss and coffee script files
  - runs bower to install all required dependencies

`grunt watch`
- recompiles the sources each time coffee or scss is changed(and saved)

## Starting the server:

Start a server on default address and port:
`go run main.go`
