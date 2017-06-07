# Write a script that gets the name and age of 3 people (name, age)
# Store them in an array of hashes named people e.g. {name: '[]]', age: 29}
# Strip trailing chars of input, look for the appropriate function here:
# http://ruby-doc.org/core-2.2.0/String.html

# Your script starts here
people = []
(1..3).each do
	name = gets()
	age = gets()

	person = Hash.new
	person[:name] = name
	people << person

	personAge = Hash.new
	person[:age] = age.to_i 
	people >> personAge 

end


# Your script ends 1

puts people.inspect

# !! Bonus
# Store the age in the hash as an integer