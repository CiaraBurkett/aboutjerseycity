require 'sinatra'
require 'slim'
require 'unicorn'

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
  		.row
			header
				div class="large-4 columns"
					img src="http://placehold.it/400x100&text=Logo"
				div class="large-8 columns"
					nav
						ul class="inline-list right"
							li
								a href="#" Home
							li
								a href="#" About
							li
								a href="#" Submit
							li
								a href="#" Blog
							li
								a href="#" Contact

  	==yield

  	footer class="row"
  		div class="large-12 columns"
  			p This is the footer.

script src="javascripts/vendor/jquery.js"
script src="javascripts/foundation/foundation.js"
script src="javascripts/foundation/foundation.alerts.js"
script src="javascripts/foundation/foundation.clearing.js"
script src="javascripts/foundation/foundation.cookie.js"
script src="javascripts/foundation/foundation.dropdown.js"
script src="javascripts/foundation/foundation.forms.js"
script src="javascripts/foundation/foundation.joyride.js"
script src="javascripts/foundation/foundation.magellan.js"
script src="javascripts/foundation/foundation.orbit.js"
script src="javascripts/foundation/foundation.placeholder.js"
script src="javascripts/foundation/foundation.reveal.js"
script src="javascripts/foundation/foundation.section.js"
script src="javascripts/foundation/foundation.tooltips.js"
script src="javascripts/foundation/foundation.topbar.js"

javascript:
  $(document).foundation();
