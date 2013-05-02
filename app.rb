require 'sinatra'
require 'slim'

get '/' do
  slim :index
end

__END__
@@layout
doctype html
html
  head
  	meta charset="UTF-8"
  	meta name="viewport" content="width=device-width"
  	title About Jersey City, a local directory
  	link rel="stylesheet" href="stylesheets/app.css"
  	link rel="stylesheet" href="stylesheets/normalize.css"
  	script src="javascripts/vendor/custom.modernizr.js"
  
  body
  	.container
  		==yield

  		footer
  			p This is the footer.