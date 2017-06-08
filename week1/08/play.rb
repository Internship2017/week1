# Make a blog web app
# 1. Import all the authors on startup
# 2. Import all the posts on startup
# 3. Render all the posts, authors and tags
#
# * Put all your ruby class in lib
# * Only declare and run your app in this file

require 'csv'
require 'erb'
require 'rack'
require 'github/markup'
require 'csv'

# Your code starts here

class Author
  attr_accessor :title, :description, :author, :git, :twitter, :image

  def initialize(title, description, author, git, twitter, image)
    @author = author
    @title = title
    @description = description
    @git = git
    @twitter = twitter
    @image = image
  end

end

class Reader

  def retrieve_csv
    authors = []
    CSV.foreach('support/courses.csv', headers: true) do |row|
      authors << Author.new(row["title"], row["description"], row["author"], row["git"], row["twitter"], row["img"])
    end
    authors
  end
end

class Page

  def initialize
    authors = Reader.new
    authors_collection = authors.retrieve_csv
    @authors = authors_collection
  end

  def render
    ERB.new(File.read('views/index.erb')).result(binding)
  end

end

webapp = -> (env) {
  ['200', {'Content-Type' => 'text/html'}, [Page.new.render]]
}

# Rack::Handler::WEBrick
# Webrick Server

Rack::Handler::WEBrick.run webapp, Host: '0.0.0.0'

# Your code ends here
