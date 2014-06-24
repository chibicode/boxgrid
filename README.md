# BoxGrid

![BoxGrid](assets/images/readme.png)

BoxGrid helps you compare CSS grid systems. The following six visually identical pages are implemented using each grid system:

1. Basic, Responsive Grid Columns
2. Columns w/ No Gutters
3. Responsive Reset
4. Column Offsets
5. Nested Grid
6. Source Ordering

↓ Take a look at the demo below to see what we mean.

### [Demo](http://ellekasai.github.io/boxgrid)

## Currently Available Grids

* [Jeet](ellekasai.github.io/boxgrid/framework-examples/jeet/)

## Contributing: Getting Started

#### 1. Install Dependencies

```
bundle install
bower install
npm install
```

#### 2. Copy a Directory

Copy `_starter-template` directory into `framework-examples`. Then rename the directory to match the name of the grid system. *NOTE: Do not use spaces in the directory name.*

Also, you must rename starter-example.scss to match the folder name/CSS preprocessor you're using.

#### 3. Edit Metadata

Edit the YAML front matter in `index.html` - you'll see directions.

#### 4. Implement HTML & CSS

* HTML files to edit are `[1-6].html` files in `pages` directory.
* CSS files to edit are `_[1-6].(scss|styl|less)` in `stylesheets/pages` directory.
* Download CSS files necessary for the grid system anywhere you want. Feel free to use bower (`bower.json`) is already prepared for you.

While developing, you can use `grunt` to compile CSS and access the server at http://localhost:7287.

#### 5. Push and Submit Pull Request

:)

## Open Source Libraries Used

* [normalize.css](https://github.com/necolas/normalize.css/)
* [Typeplate](https://github.com/typeplate/starter-kit)
* [Drop.js](https://github.com/HubSpot/drop)
* [Trianglify](http://qrohlf.com/trianglify/) & [D3](https://github.com/mbostock/d3)
* [fullPage.js](https://github.com/alvarotrigo/fullPage.js)
* [Tooltip](https://github.com/HubSpot/tooltip/)
* [nanoscroller](https://github.com/jamesflorentino/nanoScrollerJS)

## License

MIT @ [Elle Kasai](http://ellekasai.mit-license.org/) / [Shu Uesugi](http://chibicode.mit-license.org/)
