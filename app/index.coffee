util = require 'util'
path = require 'path'
yeoman = require 'yeoman-generator'
yosay = require 'yosay'
chalk = require 'chalk'
compact = require 'lodash.compact'
camelize = require 'camelize'
cint = require 'cint'
nativity = require 'nativity'

nativity.install Function.prototype, cint, ['inContext']

NpmModuleGenerator = yeoman.generators.Base.extend(
	init: ->

		# set instance variables for templating
		@pkg = require('../package.json')
		@username = 'metaraine'
		@camelize = camelize
		@on 'end', ->
			if !@options['skip-install']
				@installDependencies()

	askFor: ->
		done = @async()

		# Have Yeoman greet the user.
		@log yosay('Welcome to the marvelous NpmModule generator!')
		prompts = [
			{
				type: 'text'
				name: 'project'
				message: 'Project Name'
				default: path.basename(@env.cwd)
			}
			{
				type: 'text'
				name: 'description'
				message: 'Project Description'
			}
			{
				type: 'text'
				name: 'keywords'
				message: 'Keywords (comma-separated)'
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
			props.keywords = compact(props.keywords.split(',').map(String.prototype.trim.inContext()))
			props.prettyKeywords = JSON.stringify(props.keywords).replace(/([[,])/g, '$1\n    ').replace(/]/g, '\n  ]')
			@props = props
			done()
		).bind(this)

	app: ->
		this.expandFiles('**', cwd: this.sourceRoot())
			.map((file)->
				@copy(file, file
					.replace('_package.json', 'package.json')
					.replace(/^_/, '.')
				)
			, this)
)

module.exports = NpmModuleGenerator
