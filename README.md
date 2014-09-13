# generator-raine-app

This is my personal generator for creating node web apps. It changes a lot as I experiment and incorporate new technology, so it's not meant to be a stable generator for widespread reuse.


### What it includes

- gulp
	- script concat & min
  - imagemin
  - livereload
- express
- coffeescript
- SCSS


### Directory structure of generated app

- app
	- *Everything gets compiled/copied here*
- src
  - controllers
  - public
    - images
    - scripts
    - styles
  - views


## Usage

Install:

```bash
$ git clone https://github.com/metaraine/generator-raine-app
$ npm link
```

Create a new web app like this:

```bash
$ yo raine-app
```

To run the app after it's been generated

```bash
$ gulp
$ node app
```


## License

ISC
