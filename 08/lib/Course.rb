class Course
  attr_accessor :title, :description, :author, :tags

  def initialize(title, description, author, tags)
    @title = title
    @description = description
    @author = Author.new(author)
    @tags = tags.split(",")
  end
end
