# Write a script that gets the name and age of 3 people (name, age)
# Store them in an array of hashes named people e.g. {name: 'Adrian', age: 29}
# Strip trailing chars of input, look for the appropriate function here:
# http://ruby-doc.org/core-2.2.0/String.html

# Your script starts here

def get_name
  puts "What is your name?"
  gets.chomp
end

def get_age
  puts "What is your age?"
  gets.chomp.to_i
end

people = []

(1..3).each do
  person = {name: get_name, age: get_age}
  # puts person
  people << person
end

# Your script ends here

puts people.inspect

# !! Bonus
# Store the age in the hash as an integer
