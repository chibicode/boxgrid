module.exports = (grunt) ->
  require('load-grunt-config')(grunt)

  # http://stackoverflow.com/a/16672303/114157
  frameworkCompileFiles = {}
  frameworkWatchFiles = {}
  for lang in ["scss"]
    frameworkCompileFiles[lang] =\
      for target in grunt.file.expand "framework-examples/*"
        {
          expand: true
          cwd: "#{target}/stylesheets/"
          src: "**/*.#{lang}"
          dest: "#{target}/stylesheets/"
          ext: '.css'
        }
    frameworkWatchFiles[lang] = for file in frameworkCompileFiles[lang]
      "#{file['cwd']}#{file['src']}"

  frameworkCopyFiles =\
    for target in grunt.file.expand "framework-examples/*"
      target = target.split("/")[1]
      {
        expand: true
        cwd: "framework-examples/#{target}/"
        src: ["pages/*", "stylesheets/pages/*"]
        dest: "_includes/#{target}/"
      }

  grunt.initConfig
    copy:
      all:
        files: frameworkCopyFiles
    jekyll:
      build:
        options:
          bundleExec: true
          config: ["_config.yml", "_config.dev.yml"]
    connect:
      server:
        options:
          port: '7287',
          base: '_site'
    watch:
      sass:
        files: ['<%= sass.common.files[0].cwd %><%= sass.common.files[0].src[0] %>'] +
              frameworkWatchFiles["scss"]
        tasks: ['sass', 'copy:all', 'jekyll:build']
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
      options:
        style: 'compressed'
      frameworkExamples:
        files: frameworkCompileFiles["scss"]
      common:
        files: [
          expand: true
          cwd: 'assets/scss/'
          src: ['**/*.scss']
          dest: 'assets/css/'
          ext: '.css'
        ]

  grunt.registerTask 'build', ['sass', 'copy:all', 'jekyll:build']
  grunt.registerTask 'default', ['build', 'connect', 'watch']
