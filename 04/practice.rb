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
module Repositories
	class Client
		def initialize
			@repos    = Github::Client::Repos.new
		end
	    def repos(user)
		    response = @repos.list user: user
	        response.map { |repo| Repositories::Repo.new(repo)}
	    end
	end
end

module Repositories
	class Repo
		attr_reader :name, :description, :stargazers_count, :url
		
		def initialize(repo)
			@name = repo.name
			@description = repo.description
			@stargazers_count = repo.stargazers_count
			@url = repo.url
		end
	end
end

cliente = Repositories::Client.new()
repos = cliente.repos("israelhz")
repos.each do |repo|
	puts repo.name
end
## Your code ends here
