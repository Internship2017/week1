## Create a Scheduler class to assign interviews for each interviewer
## 1. Every interviewer has 4 available times: 9:00, 9:30, 10:00 and 10:30
## 2. Every interviewer has more or less the same amount of interviews
## 3. The code at the bottom must run without change
## Hint: http://ruby-doc.org/core-2.2.0/Array.html#method-i-sort

INTERVIEWERS = %w{ Adrian Colin Rafa Edo Kuri }

CANDIDATES = %w{ Arturo Ricardo Rafael Pablo Mauricio Jurgen }

## Your code starts here

class Interviewer
  attr_accessor :name, :interviews

  def initialize(name)
    @name = name
    @interviews = []
  end
end

class Candidate
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end

class Scheduler
  attr_accessor :interviewers, :candidates

  def initialize()
    @interviewers = []
    INTERVIEWERS.each do |interviewer|
      interviewers.push(Interviewer.new(interviewer))
    end
    @candidates = []
    CANDIDATES.each do |candidate|
      candidates.push(Interviewer.new(candidate))
    end
  end

  def assign_interviews()
    hours = ["9:00", "9:30", "10:00", "10:30"]
    @interviewers.each do |interviewer|
        hours.each do |hour|
          if !@candidates.empty?
            interviewer.interviews.push(Interview.new(@candidates.pop, hour))
          else
            interviewer.interviews.push(Interview.new(Candidate.new("-"), hour))
          end
      end
    end
  end
end

class Interview
  attr_accessor :candidate, :time

  def initialize(candidate, time)
    @candidate = candidate
    @time = time
  end
end

# Your code ends here

scheduler = Scheduler.new

scheduler.assign_interviews

scheduler.interviewers.each do |interviewer|
  puts "###Entrevistas de #{interviewer.name} ###"
  interviewer.interviews.each do |interview|
    puts "#{interview.candidate.name} a las: #{interview.time}"
  end
end
