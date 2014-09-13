# generator-raine-app
>

This is my personal generator for creating new web apps.

### Stack

- gulp
	- script concat & min
  - imagemin
  - livereload
- express
- coffeescript
- SCSS


### Directory Structure

- app *Everything gets compiled/copied here*
- src
  - controllers
  - public
    - images
    - scripts
    - styles
  - views



## Usage

It's not on npm, so you'll have to clone and link:

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
