# Create a website that hosts:
# 1. The most popular gag in the 9gag homepage (based on points)
# 2. The most commented gag in the homepage
# ** Place your files in the /practice directory
#
# Hint: Use the GagReader class already required

require 'rack'
require 'erb'
require 'rubygems'
require 'github_api'
require 'github/markup'

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


    def repositories_markdown

      # Write a file
      file = File.open('./support/markdown_git.md', 'a')
      file.write("##Intern: #{@git_user}\n")
      repositories.each do |repo|

        file.write("###Repository: #{repo.name}\n")
        file.write("2. Description: #{repo.description}\n")
        file.write("3. Stargazers: #{repo.stargazers_count}\n")
        file.write("4. URL: #{repo.url}\n")
        file.write("\n")
      end
      file.write("\n")
      file.close
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
  client = Github.new basic_auth: ''
  repository_collection = GitApi::RepositoryCollection.new(username, client)
  repository_collection.repositories
  #repository_collection.display_repositories

  repository_collection.count_repos
  intern_repos << repository_collection

  file = File.open('./support/markdown_git.md', 'w+')
  file.write("#Internship Icalia 2017\n")
  file.close

  intern_repos.each do |intern|
    intern.repositories_markdown
  end

  #puts "Cantidad Total Repos: #{repository_collection.count_repos}"
  #puts "Cantidad Total Stargazers: #{repository_collection.count_stars}"
end

file = File.open('./support/markdown_git.md', 'a')
file.write("##Tiene más Stargazers: #{intern_repos.sort_by(&:count_stars).last.git_user}\n")
file.write("##Tiene más Repos: #{intern_repos.sort_by(&:count_repos).last.git_user}\n")
file.close


# Your code starts here

class Page

  def render
    ERB.new(File.read('./layout.erb')).result(binding)
  end

  def content
    render do
      GitHub::Markup.render('markdown_git.md', File.read('./support/markdown_git.md'))
    end
  end
end

webapp = -> (env) {
  ['200', {'Content-Type' => 'text/html'}, [ Page.new.content ] ]
}

# Rack::Handler::WEBrick
# Webrick Server
Rack::Handler::WEBrick.run webapp, Host: "0.0.0.0"


# Your code ends here