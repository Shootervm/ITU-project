# Gruntfile that will watch for any static changes and reflect them into tmp
#
# @author Gelidus <gelidus@flowup.eu>
# @version 1.0 : 30.8.2015

module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      app:
        expand: true
        cwd: 'static/script'
        src: ['**/**.coffee']
        dest: '.tmp/script/src'
        ext: '.js'

    sass:
      dist:
        options:
          style: "expanded"
        files: [
          {
            expand: true
            cwd: "static/style"
            src: ["app.scss"]
            dest: ".tmp/style"
            ext: ".css"
          }
        ]

    copy:
      static:
        cwd: "static/html"
        src: "**/*"
        dest: ".tmp"
        expand: true
      translation:
        cwd: "static/translation"
        src: "**/*"
        dest: ".tmp/translation"
        expand: true

    uglify:
      platform:
        options:
          beautify: true
          mangle: false
        files:
          '.tmp/script/app.min.js': [
            '.tmp/script/src/app.js'
            '.tmp/script/src/service/*.js'
            '.tmp/script/src/directive/*.js'
            '.tmp/script/src/controller/*.js'
          ]

    bower:
      install: {}
      options:
        targetDir: ".tmp/bower_components"

    watch:
      coffee:
        files: 'static/script/**'
        tasks: ['coffee', 'uglify']
      less:
        files: 'static/style/**'
        tasks: ['sass']
      copy:
        files: "static/html/**"
        tasks: ["copy:static"]
      translation:
        files: "static/translation/**"
        tasks: ["copy:translation"]

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-bower-task'

  # Default task.
  grunt.registerTask 'default', ['coffee', 'sass', 'uglify', 'copy', 'bower']
