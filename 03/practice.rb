## Create a Scheduler class to assign interviews for each interviewer
## 1. Every interviewer has 4 available times: 9:00, 9:30, 10:00 and 10:30
## 2. Every interviewer has more or less the same amount of interviews
## 3. The code at the bottom must run without change
## Hint: http://ruby-doc.org/core-2.2.0/Array.html#method-i-sort

INTERVIEWERS = %w{ Adrian Colin Rafa Edo Kuri }

CANDIDATES = %w{ Arturo Ricardo Rafael Pablo Mauricio Jurgen }

## Your code starts here
class Interview
  attr_accessor :time, :candidate
end

class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Interviewer < Person
  def interviews

  end

end

class Candidate < Person

end

class Scheduler
  attr_accessor :candidates
  attr_accessor :interviewers
  def initialize
    @candidates = CANDIDATES.map do |candidate|
      Candidate.new(candidate)
    end
    @interviewers = INTERVIEWERS.map do |interviewer|
      Interviewer.new(interviewer)
    end
  end

  def assign_interviews
    @interviewers.

  end
  def interviewers
    @interviewers = interviewers
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
