Connoisseur
===========

Generates HTML pages using data from 
[the unofficial LCBO API](http://lcboapi.com/).

Usage
-----

The main file is `router.rb`. It is run from the command line (i.e. in the 
Terminal app), and outputs HTML to the console.

There are two "actions" which can be specified by a command-line argument:

1. `ruby router.rb index` outputs the HTML for a list of products.
2. `ruby router.rb show [id]` outputs the HTML for a detailed product page
for product with the given id. Note that `[id]` should be replaced with an
actual product id (without square brackets). The product id's can be found 
in the output of the `index` action.

The `index` action can also take an optional second parameter which is a 
search term, to only show results that match the given word, e.g.:

`ruby router.rb index bourbon` lists only products that contain the
word "bourbon" in one of the fields.


Viewing the output in a browser
-------------------------------

The output can be saved as a file using the `>` shell operator, e.g.:

`ruby router.rb index > output.html` saves the output in a file named 
`output.html` which can then be opened in a web browser.

