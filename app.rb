require 'sinatra'
require 'slim'
require 'thin'
require 'pg'
require 'sqlite3'
require 'sequel'

#  Connect to an in-memory database
DB = Sequel.connect(ENV['DATABASE_URL'] || 'postgres://zdrdzztahaphpr:QC0RU1CXYaBsWusliolS1gJ8QQ@ec2-54-225-112-205.compute-1.amazonaws.com:5432/d2jo3hqrbff1u7')

#  Create a projects table
DB.create_table :projects do
	primary_key :id
	String :project_name
	String :project_url
	String :user_email
	String :description
end

#  Create a dataset from the projects table
projects = DB[:projects]


#  Create a Project object
class Project < Sequel::Model

end

#  Routes to static pages
get '/' do
	@projects = Project.all
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

#  Retrieve information from client
post '/' do
	project = Project.new
	project.project_name = params[:project_name]
	project.project_url = params[:project_url]
	project.user_email = params[:user_email]
	project.description = params[:description]
	project.save
	redirect '/thankyou'
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
  			p 
  				small
  					About Jersey City is an <a href="http://www.entertainmentbear.com" target="_blank">Entertainment Bear</a> labor of love!

section id="submitModal" class="reveal-modal large"
	h3 Submit Your Project!
	p By listing your project with About Jersey City, you're not just driving more traffic to your website (although it certaintly doesn't hurt).  You're encouraging your friends and neighbors to contribute to the local economy in ways that benefit us all.

	form method="POST" action="/"
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
