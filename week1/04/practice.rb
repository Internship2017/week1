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
require 'json'


## Your code starts here
	
module GitHub

	class User
		attr_reader :username
		def initialize(username)
			@username = username
		end

		def repos
			@repos ||= (Github.repos.list user: @username).map { |repo_attrs|  Repo.new(repo_attrs) }
		end
	end


	class Repo
		attr_reader :name, :description, :stargazers_count, :url

		def initialize(attrs = {})
			@name = attrs["name"]
			@description = attrs["description"]
			@stargazers_count = attrs["stargazers_count"]
			@url = attrs["url"]
		end
	end

	USERNAMES=["Anapaotrev", "erik0686", "HectorMg", "Israelhz", "JorgeATR", "joseantoniordlmc", "kvinuk", "lmauromb", "Rikard189"].freeze
	@users ||= USERNAMES.map { |username| User.new(username) }
	@leader = @users.first

	def self.max_stars
		maximum_current_stars = -1
		@users[1..-1].each do |user|
			repos_stars = user.repos.map { |repo| repo.stargazers_count }
			total_user_stars = repos_stars.reduce(:+)
			if total_user_stars > maximum_current_stars
				maximum_current_stars = total_user_stars
				@leader = user
			end
		end
		@leader
	end

	def self.max_repos
		maximum_current_repos = @users.first.repos.count
		@users[1..-1].each do |user|
			if user.repos.count > maximum_current_repos
				maximum_current_repos = user.repos.count
				@leader = user
			end
		end
		@leader
	end
end

user = GitHub::User.new("kvinuk")
user.repos.each do |repo|
	puts "name: #{repo.name} description: #{repo.description} stargazers_count: #{repo.stargazers_count} url: #{repo.url}"
end

user_max_repos = GitHub.max_repos
puts "Max repos: #{user_max_repos.username} con #{user_max_repos.repos.count} Repos"

user_max_stars = GitHub.max_stars
puts "Max Stars: #{user_max_stars.username}"


## Your code ends here
