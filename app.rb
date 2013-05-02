require 'sinatra'
require 'slim'
require 'thin'

get '/' do
  slim :index
end

get '/about' do
  slim :about
end

get '/blog' do
  slim :blog
end

get '/contact' do
  slim :contact
end

get '/thankyou' do
  slim :thankyou
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
								a href="/" Home
							li
								a href="/about" About
							li
								a href="#submit" data-reveal-id="submitModal" Submit
							li
								a href="/blog" Blog
							li
								a href="/contact" Contact

  	==yield

  	footer class="row"
  		div class="large-12 columns"
  			p This is the footer.

section id="submitModal" class="reveal-modal large"
	h3 Submit Your Project!
	p By listing your project with About Jersey City, you're not just driving more traffic to your website (although it certaintly doesn't hurt).  You're encouraging your friends and neighbors to contribute to the local economy in ways that benefit us all.

	form
		fieldset
			legend Show the community what you're working on.

			.row
				div class="large-12 columns"
					label Project Name
					input type="text" name="project_name" placeholder="Example Project"

			.row
				div class="large-6 columns"
					label Project URL
					input type="text" name="project_url" placeholder="example.com"
				div class="large-6 columns"
					label Your Email Address
					input type="text" name="user_email" placeholder="me@example.com"

			.row
				div class="large-12 columns"
					label Project Description
					textarea name="description" placeholder="Write a brief two to three sentence description of your project here."

			.row
				div class="large-12 columns"
					input class="button" type="submit" value="Submit"

	a class="close-reveal-modal" &#215;

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
