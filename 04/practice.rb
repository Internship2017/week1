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

module Ghub

  class User
    attr_accessor :name, :repos, :number_of_repos

    def initialize(name)
      github = Github.new basic_auth: ''
      @name = name
      @repos = github.repos.list user: @name
      @repos = @repos.map { |repo_raw| Repo.new(repo_raw) }
      @number_of_repos = @repos.length
    end
  end

  class Repo
    attr_accessor :name, :description, :stargazers_count, :url

    def initialize(repo_raw)
      @name = repo_raw["name"]
      @description = repo_raw["description"]
      @stargazers_count = repo_raw["stargazers_count"]
      @url = repo_raw["clone_url"]
    end
  end
end


github_user = Ghub::User.new('lmauromb')

puts "User: #{github_user.name}"
puts "Total of repos: #{github_user.number_of_repos}"

github_user.repos.each do |repo|
  puts "Name: #{repo.name}"
  puts "Description: #{repo.description}"
  puts "Stars: #{repo.stargazers_count}"
  puts "URL: #{repo.url}"
end

## Your code ends here
