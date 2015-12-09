# ITU Project

## Requirements

* [Node.js and npm](nodejs.org)
* [Golang](golang.org)
* [Bower](bower.io)
* [Ruby]
* [Gem]sass

## Creating the app

Install npm dependencies(grunt)
`npm install -g grunt grunt-cli`
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
