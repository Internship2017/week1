require 'redcarpet'
require 'json'

## Your code starts here

module Sepomex
	class Client
		def get_states
			url = 'www.sepomex.icalialab/api/v1/states'
			response = RestClient.get(states)
			JSON.parse(response)
		end
	end
end

module Sepomex
	class State
		def states(states)
			states = 
		end
	end
end

client = Sepomex::Client.new
states = client.get_states

states.each do |states|
	puts state.name
end

## Your code ends here
