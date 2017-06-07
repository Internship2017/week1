## Get all the repos for your github user (or: hackerschoolmty if you have no repo)
## GEM: https://github.com/peter-murach/github
##  gem install github_api
## Create an object for each repo storing: name, description, stargazers_count and url
##
## Bonus! Find find out
## 1. Who has more repos in the room
## 2. Who has more stars in his repos in the room

##require 'rubygems'
##require 'github_api'

## Your code starts here

module Repositorios
USERNAMES=["Anapaotrev", "erik0686", "HectorMg", "Israelhz", "JorgeATR", "joseantoniordlmc", "kvinuk", "lmauromb", "Rikard189"]
  class Reps
      def repository(user)
      	repos    = GitHub::Client::Repos.new
		response = repos.list user: user
		response.map{Repositorios::State.new (repo.name, repo.description, repo.stargazers_count, repo.url)}
      end
  end
end


module Repositorios
  class User
    attr_reader :name, :description, :stargazers_count , :url
    def initialize(name,description,stargazers_count,url)
      @name=name
      @description=description
      @stargazers_count=stargazers_count
      @url=url
    end
  end
end
client = Repositorios::Reps.new
repos = client.repository("erik0686")
repos.each do |repos_full|
  puts repos_full.name
end

## Your code ends here
