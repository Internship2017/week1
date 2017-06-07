# Count how many times the letter a is repeated in the countries in the world

# Your code starts here
class Calc
  def read
    countries = File.readlines('/code/support/countries.txt').each do |country|
      puts country
  end
end
# Your code ends here
