require 'csv'

class CsvReader
  attr_reader :courses, :avatar

  def courses
    @courses = []
    CSV.foreach("./support/courses.csv", headers: true) do |row|
      @courses << Course.new(row["title"], row["description"], row["author"], row["tags"])
    end
    @courses
  end

  # def avatar name
  #   CSV.foreach("./support/authors.csv", headers: true) do |row|
  #     if row["name"] == name
  #       @avatar = row["avatar"]
  #     end
  #   end
  #   @avatar
  # end
end
