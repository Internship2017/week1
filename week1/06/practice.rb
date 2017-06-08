# Get all the jokes on the 9gag homepage
# 1. Get the Joke with most points on the 9gag.com homepage
# 2. Get the Joke with the most comments
# Reference:
# http://ruby-doc.org/core-2.2.0/Array.html
# http://ruby-doc.org/core-2.2.0/String.html

require 'rest-client'
require 'nokogiri'

# Your code starts here

class Repo
  attr_accessor :name, :forks, :stars

  def initialize(name, forks, stars)
    @name = name
    @forks = forks
    @stars = stars
  end
end

# Read the html
document = RestClient.get('https://github.com/explore')
# Model the DOM
dom = Nokogiri::HTML(document)
# Traverse the DOM
repos = []

dom.css('.clearfix li').each do |repo_li|
  fork_stars = repo_li.css('span.collection-stat.tooltipped.tooltipped-n')
  forks = fork_stars[0].text
  stars =  fork_stars[1].text
  name = repo_li.css('a.repo-name.css-truncate.css-truncate-target').text

  repos << Repo.new(name, forks, stars)

end

# Repos
repos.each do |repo|
  puts repo.inspect
end

# Your code ends here
