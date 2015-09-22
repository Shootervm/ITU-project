============
Material APP
============

Is an template aplication witch preprepared components for an easy to use and quick new Golang/Angular/Material web app structure.

Requirements
============

To start using this app you'll need to prepare you're enviroment.
Required is to have:
* NPM (nodeJS pacage manager) - will provide all of other more complex dependencies
* Golang (GO language) 

Usage
=====

To get project use `go get github.com/flowup/material-app` or `git clone git@github.com:flowup/material-app.git`

#### When running app for first time:


`go get ./...` 
 * will find and get all external Go dependencies
`npm install` 
 * will resolve and install all external dependencies of aplication like *grunt* or *bower* (may take a while to finish)

#### If all dependencies were installed you can start using app like:

`grunt`
 * performs all necessary operations to set up everything
   - compiles the scss and coffee script
   - runs bower install and prepare all the components
   - uglify the scripts and css

`grunt watch`
* run if there is a need to constantly recompile CSS of Coffee script run after all changes

#### Starting server:

`go run main.go` 
 * will start a server on default address and port
 * if you need to change a port or an address you can do it using enviroment variables
   - for example `port=1337 go run main.go` or `address=127.0.0.1 port=8080 go run main.go`
