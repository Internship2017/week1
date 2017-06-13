class Author
  attr_reader :name, :avatar

  def initialize(name)
    @name = name
  end

  # def avatar
  #   @avatar ||= CsvReader.avatar(@name)
  # end
end
