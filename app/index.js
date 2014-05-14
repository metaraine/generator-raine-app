'use strict';
var util = require('util');
var path = require('path');
var yeoman = require('yeoman-generator');
var yosay = require('yosay');
var chalk = require('chalk');

var NpmModuleGenerator = yeoman.generators.Base.extend({
  init: function () {
    this.pkg = require('../package.json');

    this.on('end', function () {
      if (!this.options['skip-install']) {
        this.installDependencies();
      }
    });
  },

  askFor: function () {
    var done = this.async();

    // Have Yeoman greet the user.
    this.log(yosay('Welcome to the marvelous NpmModule generator!'));

    var prompts = [{
      type: 'text',
      name: 'project',
      message: 'project name',
      default: path.basename(this.env.cwd)
    }];

    this.prompt(prompts, function (props) {
      this.props = props;

      done();
    }.bind(this));
  },

  app: function () {
    this.copy('_bower.json', 'bower.json');
    this.copy('_component.json', 'component.json');
    this.copy('_editorconfig', '.editorconfig');
    this.copy('_gitattributes', '.gitattributes');
    this.copy('_gitignore', '.gitignore');
    this.copy('_jshintrc', '.jshintrc');
    this.copy('_package.json', 'package.json');
    this.copy('_travis.yml', 'travis.yml');
    this.copy('browser.js', 'browser.js');
    this.copy('index.js', 'index.js');
    this.copy('license', 'license');
    this.copy('readme.md', 'readme.md');
    this.copy('test.js', 'test.js');
  }
});

module.exports = NpmModuleGenerator;
