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
  	title About Jersey City, a local directory
  	link rel="stylesheet" href="stylesheets/app.css"
  	link rel="stylesheet" href="stylesheets/normalize.css"
  
  body
  	.container
  		==yield

  		footer
  			p This is the footer.