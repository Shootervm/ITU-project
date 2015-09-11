# Gruntfile that will watch for any static changes and reflect them into tmp
#
# @author Gelidus <gelidus@flowup.eu>
# @version 1.0 : 30.8.2015

module.exports = (grunt) ->
  grunt.initConfig
    coffee:
      app:
        expand: true
        cwd: 'source/script'
        src: ['**/**.coffee']
        dest: 'static/script/src'
        ext: '.js'

    sass:
      dist:
        options:
          style: "expanded"
        files: [
          {
            expand: true
            cwd: "source/style"
            src: ["app.scss"]
            dest: "static/style"
            ext: ".css"
          }
        ]

    uglify:
      platform:
        options:
          beautify: true
          mangle: false
        files:
          'static/script/app.min.js': [
            'static/script/src/app.js'
            'static/script/src/service/*.js'
            'static/script/src/directive/*.js'
            'static/script/src/controller/*.js'
          ]

    bower:
      install: {}
      options:
        targetDir: "static/bower_components"

    watch:
      coffee:
        files: 'source/script/**'
        tasks: ['coffee', 'uglify']
      less:
        files: 'source/style/**'
        tasks: ['sass']
      bower:
        files: 'bower.json'
        tasks: ['bower']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-sass'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-bower-task'

  # Default task.
  grunt.registerTask 'default', ['coffee', 'sass', 'uglify', 'bower']
