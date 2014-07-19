util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
yosay = require 'yosay'
chalk = require 'chalk'
compact = require 'lodash.compact'
camelize = require 'camelize'

NpmModuleGenerator = yeoman.generators.Base.extend(
	init: ->

		# set instance variables for templating
		@pkg = require('../package.json')
		@username = 'metaraine'
		@camelize = camelize
		@on 'end', ->
			@installDependencies()	unless @options['skip-install']

	askFor: ->
		done = @async()

		# Have Yeoman greet the user.
		@log yosay('Welcome to the marvelous NpmModule generator!')
		prompts = [
			{
				type: 'text'
				name: 'project'
				message: 'project name'
				default: path.basename(@env.cwd)
			}
			{
				type: 'text'
				name: 'description'
				message: 'project description'
			}
			{
				type: 'text'
				name: 'keywords'
				message: 'keywords (comma-separated)'
			}
		]

		# convert the keywords string into an array
		# remove empty values
		# trim

		# prettify the keywords to display each one on a separate line with correct indentation in the package.json
		# add '    \n' after each item
		# add a newline before the closing ]

		# assign props to instance for use in templating
		@prompt prompts, ((props) ->
			props.keywords = compact(props.keywords.split(',').map((s) ->
				s.trim()
			))
			props.prettyKeywords = JSON.stringify(props.keywords).replace(/([[,])/g, '$1\n    ').replace(/]/g, '\n  ]')
			@props = props
			done()
		).bind(this)

	app: ->
		@copy '_editorconfig', '.editorconfig'
		@copy '_gitattributes', '.gitattributes'
		@copy '_gitignore', '.gitignore'
		@copy '_jshintrc', '.jshintrc'
		@copy '_travis.yml', '.travis.yml'
		@copy '_package.json', 'package.json'
		@copy 'index.js', 'index.js'
		@copy 'license', 'license'
		@copy 'readme.md', 'readme.md'
		@copy 'test.js', 'test.js'
)

module.exports = NpmModuleGenerator
