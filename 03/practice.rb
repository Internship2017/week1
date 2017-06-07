## Create a Scheduler class to assign interviews for each interviewer
## 1. Every interviewer has 4 available times: 9:00, 9:30, 10:00 and 10:30
## 2. Every interviewer has more or less the same amount of interviews
## 3. The code at the bottom must run without change
## Hint: http://ruby-doc.org/core-2.2.0/Array.html#method-i-sort

INTERVIEWERS = %w{ Adrian Colin Rafa Edo Kuri }

CANDIDATES = %w{ Arturo Ricardo Rafael Pablo Mauricio Jurgen }

## Your code starts here
class Scheduler
	def assign_interviews(canName, intname, time)
		times = ["9:00", "9:30", "10:00", "10:30"]

	end
end

class Person
	attr_reader :name

	def initialize(name)
		@name = name
	end
end

class Interviewer < Person 
	include Interview

	def interviews

	end

	def interviewers
		@intNames = INTERVIEWERS
	end
end

class Interview
	attr_accessor :time

	def init(time)
		@time = time
	end
end

class Candidate < Person
	
end
## Your code ends here

scheduler = Scheduler.new

scheduler.assign_interviews

scheduler.interviewers.each do |interviewer|
  puts "###Entrevistas de #{interviewer.name} ###"
  interviewer.interviews.each do |interview|
    puts "#{interview.candidate.name} a las: #{interview.time}"
  end
end
