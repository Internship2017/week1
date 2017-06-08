# Create a website that hosts:
# 1. The most popular gag in the 9gag homepage (based on points)
# 2. The most commented gag in the homepage
# ** Place your files in the /practice directory
#
# Hint: Use the GagReader class already required

require 'rack'
require 'erb'
# require 'debugger'
# Dir["./support/*.rb"].each {|file| require file }

# Your code starts here
require 'rest-client'
require 'nokogiri'
require 'github/markup'

class Page

  def render
    ERB.new(File.read('./layout.erb')).result(binding)
  end

  def content
    render do
      GitHub::Markup.render('output_markdown.md', File.read('./output_markdown.md'))
    end
  end

end

# Read the html
document = RestClient.get('https://github.com/explore')
# Model the DOM
dom = Nokogiri::HTML(document)
# Traverse the DOM
trending_repos = []

explore_trending = dom.css('#explore-trending')

dom.css('#explore-trending').css('.clearfix li').each do |trending_repo|
  repo_name = trending_repo.css('a').text
  repo_forks = trending_repo.css('span')[0].text.sub(',','').to_i
  repo_stars = trending_repo.css('span')[1].text.sub(',','').to_i
  trending_repos << {
    repo_name: repo_name,
    repo_forks: repo_forks,
    repo_stars: repo_stars
  }
end

# Write a File

file = File.open('./output_markdown.md', 'w+')
file.write("# This Week GitHub Trending Repositories\n\n")
trending_repos.each do |repo|
  file.write("## #{repo[:repo_name]}\n")
  file.write("- Stars: **#{repo[:repo_stars]}**\n")
  file.write("- Forks: **#{repo[:repo_forks]}**\n\n")
end
file.close


webapp = -> (env) {
  ['200', {'Content-Type' => 'text/html'}, [ Page.new.content ] ]
}

# Rack::Handler::WEBrick
# Webrick Server
Rack::Handler::WEBrick.run webapp, Host: "0.0.0.0"
# Your code ends here
