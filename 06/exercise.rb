require 'rest-client'
require 'nokogiri'

# Read the html
document = RestClient.get('https://github.com/explore')
# Model the DOM
dom = Nokogiri::HTML(document)
# Traverse the DOM
trending_repos = []

explore_trending = dom.css('#explore-trending')

explore_trending.css('.clearfix li').each do |trending_repo|
  repo_name = trending_repo.css('a').text
  repo_forks = trending_repo.css('span')[0].text.sub(',','').to_i
  repo_stars = trending_repo.css('span')[1].text.sub(',','').to_i
  trending_repos << {
    repo_name: repo_name,
    repo_forks: repo_forks,
    repo_stars: repo_stars
  }
end

puts trending_repos.inspect
