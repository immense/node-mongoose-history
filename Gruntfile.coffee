module.exports = (grunt) ->
  grunt.initConfig {

    # compile coffeescript source
    coffee:
      mongoose_history:
        files:
          'lib/index.js': 'src/index.coffee'
  }

  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.registerTask('default', ['coffee'])
