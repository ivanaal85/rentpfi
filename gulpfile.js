/* Gulp function syntax
gulp.watch('files-to-watch', ['tasks', 'to', 'run']); 

Here is what a real task may look like:
gulp.task('task-name', function () {
  return gulp.src('source-files') // Get source files with gulp.src
    .pipe(aGulpPlugin()) // Sends it through a gulp plugin
    .pipe(gulp.dest('destination')) // Outputs the file in the destination folder
})

/*-----------------------------------------Documentation--------------------------------------*/


/*-----------------------------------------Requires and Tasks---------------------------------*/

// Requires Gulp
var gulp = require('gulp');

// Test gulp is running with hello function
gulp.task('hello', function() {
  console.log('Hello Gregg');
});

// Requires Useref JS File optimizer
var useref = require('gulp-useref');

// Other requires...
var uglify = require('gulp-uglify');
var gulpIf = require('gulp-if');
var cssnano = require('gulp-cssnano');
var concat = require('gulp-concat');
let cleanCSS = require('gulp-clean-css');
var htmlmin = require('gulp-htmlmin');
const imagemin = require('gulp-imagemin');
var removeEmptyLines = require('gulp-remove-empty-lines');
var strip = require('gulp-strip-comments');
var whitespace = require('gulp-whitespace');
var trimlines = require('gulp-trimlines');


//Removes comments, leading whitespace and extra lines from search-results-update.inc. Trailing removed via liquid
gulp.task('min', function () {
  return gulp.src('_System/includes/search-results-update.inc') // Get source files with gulp.src
    .pipe(strip.text({
      safe:true
  })) // Sends it through a gulp plugin
    .pipe(removeEmptyLines()) // Sends it through a gulp plugin
    .pipe(trimlines()) // Sends it through a gulp plugin
    .pipe(gulp.dest('_System/includes')) // Outputs the file in the destination folder
})

//Minifies the property-search.js file and outputs it as property-search.min.js.  Can be used for multiple files
gulp.task('compress', function() {
  gulp.src('_assets/js/property-search.js')
    .pipe(minify({
        ext:{
            src:'.js',
            min:'.min.js'
        },
        //exclude: ['tasks'],
        //ignoreFiles: ['.combo.js', '-min.js']
    }))
    .pipe(gulp.dest('_assets/js'))
});

//Optimizes the images.  Set up dev folder for images. Optimize, pipe to destination and them delete all files in dev folder.
gulp.task('default', () =>
    gulp.src(['_assets/img/**/*.jpg','_assets/img/**/*.png','_assets/img/**/*.jpeg','_assets/img/**/*.gif','_assets/img/**/*.svg'])
        .pipe(imagemin([imagemin.gifsicle({interlaced: true}),
    imagemin.jpegtran({progressive: true}),
    imagemin.optipng({optimizationLevel: 5}), imagemin.svgo({
        plugins: [
            {removeViewBox: true},
            {cleanupIDs: false}
        ]
    })
]))
        .pipe(gulp.dest('_assets/img'))
);

//Minifies the css file
gulp.task('minify-css', () => {
  return gulp.src('stylesheets/modulestylesheets.css')
    .pipe(cleanCSS({compatibility: 'ie8'}))
    .pipe(gulp.dest('stylesheets'));
});

//Combines and minifies multiple css files into on 'all.css' file
gulp.task('scripts', function() {
  return gulp.src(['_assets/css/fontello/css/fontello.css','_assets/css/font-awesome.min.css','_assets/css/normalize.css','_assets/css/foundation.min.css','_assets/css/slick.css','_assets/css/ion.rangeSlider.css','_assets/css/styles.css'])
    .pipe(concat('all.css'))
    .pipe(cleanCSS({compatibility: 'ie8'}))
    .pipe(gulp.dest('_assets/css'));
});

/* For future builds, I may be able to use useref to combine css in head document, 
but instead of cssnano to minify, I would pipe through cleanCSS */

//Combines all the scripts listed in the scripts-dev.inc file and minifies them.
gulp.task('useref', function(){
  return gulp.src('_System/Includes/scripts-dev.inc')
    .pipe(useref())
    // Minifies only if it's a JavaScript file
    .pipe(gulpIf('*.js', uglify()))
    .pipe(gulp.dest('_assets'))
  });

// Files to watch and tasks to run when changed
gulp.task('watch', function(){
gulp.watch('_assets/js/foundation.min.js', ['useref']); 
gulp.watch('_assets/js/slick.min.js', ['useref']); 
gulp.watch('_assets/js/ion.rangeSlider.js', ['useref']); 
gulp.watch('_assets/js/scripts.js', ['useref']); 
gulp.watch('_assets/js/main.js', ['useref']); 
gulp.watch('_assets/css/fontello/css/fontello.css', ['scripts']); 
gulp.watch('_assets/css/font-awesome.min.css', ['scripts']); 
gulp.watch('_assets/css/normalize.css', ['scripts']); 
gulp.watch('_assets/css/foundation.min.css', ['scripts']); 
gulp.watch('_assets/css/slick.css', ['scripts']); 
gulp.watch('_assets/css/ion.rangeSlider.css', ['scripts']); 
gulp.watch('_assets/css/styles.css', ['scripts']); 
gulp.watch('_assets/js/property-search.js', ['compress']); 
gulp.watch('_System/includes/search-results-update.inc', ['min']);     
// Other watchers
})




