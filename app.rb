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
    meta charset="utf-8"
    title About Jersey City, a local directory

  body
  	.container
  		==yield

  		footer
  			p This is the footer.