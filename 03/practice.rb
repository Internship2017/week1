## Create a Scheduler class to assign interviews for each interviewer
## 1. Every interviewer has 4 available times: 9:00, 9:30, 10:00 and 10:30
## 2. Every interviewer has more or less the same amount of interviews
## 3. The code at the bottom must run without change
## Hint: http://ruby-doc.org/core-2.2.0/Array.html#method-i-sort

INTERVIEWERS = %w{ Adrian Colin Rafa Edo Kuri }

CANDIDATES = %w{ Arturo Ricardo Rafael Pablo Mauricio Jurgen }

## Your code starts here
class Interview
	attr_accessor	:time, :candidate
end

class Candidate
	attr_accessor	:name
end

class Interviewer
	attr_accessor	:name, :interviews
end



class Scheduler
	def assign_interviews
		times = ["9:00", "9:30", "10:00", "10:30"]

		interviwers = []
		INTERVIEWERS.each do |interviewer|
			interviewer_aux = Interview.new
			interviwer_aux.name = interviewer
			interviewer_aux = []
			interviewers.push(interviewer_aux)
		end

		interviewers.each.with_index! do |interviewer, index|

			interview = Interview.new
			interview.time = times[index]

			candidate = Candidate.new
			candidate.name = CANDIDATES.delete_at(rand(6))

			interview.candidate = candidate

			interviewer.interviews.push(interview)
		end


	end

	def interviewers
		
	end
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
