## Create a Scheduler class to assign interviews for each interviewer
## 1. Every interviewer has 4 available times: 9:00, 9:30, 10:00 and 10:30
## 2. Every interviewer has more or less the same amount of interviews
## 3. The code at the bottom must run without change
## Hint: http://ruby-doc.org/core-2.2.0/Array.html#method-i-sort

INTERVIEWERS = %w{ Adrian Colin Rafa Edo Kuri }

CANDIDATES = %w{ Arturo Ricardo Rafael Pablo Mauricio Jurgen }

## Your code starts here

class Scheduler
    attr_accessor :interviewers
    attr_accessor :candidates_names

    def initialize
        @interviewers = INTERVIEWERS.map { |interviewer_name| Interviewer.new(interviewer_name)}
        @candidates = CANDIDATES.map { |candidate_name| Candidate.new(candidate_name)}
    end

    def assign_interviews
        time = Time.new(2017, 06, 06, 8, 30, 0)
        while !@candidates.empty?
            time = time + 30*60
            @interviewers.each do |interviewer|
                if !@candidates.empty?
                    interview = Interview.new(time, @candidates.pop)
                    interviewer.interviews << interview
                end
            end
        end
    end
end

class Person
    attr_accessor :name

    def initialize(name)
        @name = name
    end
end

class Interviewer < Person
    attr_accessor :interviews

    def initialize(name)
        super name
        @interviews = Array.new
    end
end

class Interview
    attr_accessor :time
    attr_accessor :candidate

    def initialize(time, candidate)
        @time = time.strftime("%H:%M")
        @candidate = candidate
    end
end

class Candidate < Person
end

## Your code ends here

scheduler = Scheduler.new

scheduler.assign_interviews

scheduler.interviewers.each do |interviewer|
  puts "###Entrevistas de #{interviewer.name} ###"
  interviewer.interviews.each do |interview|
    puts "#{interview.candidate.name} a las: #{interview.time}"
  end
end