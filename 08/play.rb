# Make a blog web app
# 1. Import all the authors on startup
# 2. Import all the posts on startup
# 3. Render all the posts, authors and tags
#
# * Put all your ruby class in lib
# * Only declare and run your app in this file

require 'csv'
require 'rack'
Dir["./lib/*.rb"].each {|file| require file }

# Your code starts here

# csv_reader = CsvReader.new()
#
# csv_reader.courses.each do |course|
#   puts course.author.name
# end

webapp = -> (env) {
  ['200', {'Content-Type' => 'text/html'}, [ Page.new.render ] ]
}

# Rack::Handler::WEBrick
# Webrick Server
Rack::Handler::WEBrick.run webapp, Host: "0.0.0.0"

# Your code ends here
