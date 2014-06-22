module.exports = (grunt) ->
  require('load-grunt-config')(grunt)
  grunt.initConfig
    copy:
      sass:
        files: [
          expand: true
          cwd: 'assets/scss/'
          src: ['**/pages/*.scss']
          dest: '_includes/'
          ext: '.scss'
        ]
    jekyll:
      build: {}
      options:
        bundleExec: true
    connect:
      server:
        options:
          port: '7287',
          base: '_site'
    watch:
      sass:
        files: ['<%= sass.compile.files[0].cwd %><%= sass.compile.files[0].src[0] %>']
        tasks: ['sass', 'copy:sass', 'jekyll:build']
      jekyll:
        files: ["index.html",
                "_layouts/**/*.html",
                "_includes/**/*.html",
                "_data/**/*.yml",
                "framework-examples/**/*.html",
                "assets/js/**/*.js"]
        tasks: ['jekyll:build']
      options:
        livereload: true
    sass:
      compile:
        options:
          style: 'compressed'
        files: [
          expand: true
          cwd: 'assets/scss/'
          src: ['**/*.scss']
          dest: 'assets/css/'
          ext: '.css'
        ]

  grunt.registerTask 'default', ['sass', 'copy:sass', 'jekyll:build', 'connect', 'watch']
