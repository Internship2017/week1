require 'erb'

class Page

  def render
    @courses = CsvReader.new.courses
    ERB.new(File.read('./views/index.erb')).result(binding)
  end

end
