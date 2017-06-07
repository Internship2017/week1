## Get all the repos for your github user (or: hackerschoolmty if you have no repo)
## GEM: https://github.com/peter-murach/github
##  gem install github_api
## Create an object for each repo storing: name, description, stargazers_count and url
##
## Bonus! Find find out
## 1. Who has more repos in the room
## 2. Who has more stars in his repos in the room
USERNAMES=["Anapaotrev", "erik0686", "HectorMg", "Israelhz", "JorgeATR", "joseantoniordlmc", "kvinuk", "lmauromb", "rikard189"]

require 'rubygems'
require 'github_api'

class User
  attr_accessor :user_name, :num_repos

  def initialize(user_name)
    @user_name = user_name
    @repos = Github::Client::Repos.new
  end

  def repositories
    @repositories ||= response.map do |repo|
      {
        name: repo.name,
        description: repo.description,
        stargazers_count: repo.stargazers_count
      }
    end
  end

  def count_repos
    puts repositories.count
  end

  private

  def response
    @response ||= @repos.list user: @user_name
  end

end

users = USERNAMES.map {|username| User.new(username)}

puts users[3].count_repos
# users.sort_by {|user| user[:repositories]}




## Your code starts here


## Your code ends here
