class Country
  def initialize
    @arr = []
  end

  def read(resource)
    result =  File.readlines('/code/week1/05/support/countries.txt').map do |f|
       puts "fCHECK #{f}"
       f.lines.each do |line|
         puts "lineCHECK #{line}" 
         @arr << line
         @cnt = @arr.join.scan(/"#{resource}"/).count
      end
    end
  puts "The character 'a' is repeated #{@cnt} times"	  
  end
end

call = Country.new
call.read(a)
