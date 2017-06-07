## Get all the repos for your github user (or: hackerschoolmty if you have no repo)
## GEM: https://github.com/peter-murach/github
##  gem install github_api
## Create an object for each repo storing: name, description, stargazers_count and url
##
## Bonus! Find find out
## 1. Who has more repos in the room
## 2. Who has more stars in his repos in the room

require 'rubygems'
require 'github_api'

## Your code starts here

module GitApi
  class RepositoryCollection
    attr_reader :git_user

    def initialize(git_user, client)
      @git_user = git_user
      @client = client
    end

    def repositories
      @repositories ||= github_repos.map { |repository| GitApi::Repository.new(repository) }
    end

    def count_repos
      @count_repos ||= repositories.size.to_i
    end

    def count_stars
      #@count_stars ||= repositories.map { |repo| repo.stargazers_count }.reduce(:+)
      @count_stars ||= repositories.map(&:stargazers_count).reduce(:+).to_i
    end

    def display_repositories
      repositories.each do |repo|
        puts "Repository: #{repo.name}"
        puts "Description: #{repo.description}"
        puts "Stargazers: #{repo.stargazers_count}"
        puts "URL: #{repo.url}"
      end
    end

  private 

  def github_repos
      @github_repos ||= @client.repos.list user: @git_user
  end
  end

  class Repository
    attr_accessor :name, :description, :stargazers_count, :url

    def initialize(attrs = {})
      @name = attrs["name"]
      @description = attrs["description"]
      @stargazers_count = attrs["stargazers_count"]
      @url = attrs["url"]
    end
  end
end


USERNAMES = ["Anapaotrev", "erik0686", "HectorMg", "Israelhz", "JorgeATR", "joseantoniordlmc", "kvinuk", "lmauromb", "Rikard189"].freeze

intern_repos=[]

USERNAMES.each do |username|
  puts "#################{username}################"
  client = Github.new
  repository_collection = GitApi::RepositoryCollection.new(username, client)
  repository_collection.repositories
  repository_collection.display_repositories
  repository_collection.count_repos
  intern_repos << repository_collection
  puts "Cantidad Total Repos: #{repository_collection.count_repos}"
  puts "Cantidad Total Stargazers: #{repository_collection.count_stars}"
end

puts intern_repos.sort_by(&:count_stars).last.git_user
puts intern_repos.sort_by(&:count_repos).last.git_user
## Your code ends here






