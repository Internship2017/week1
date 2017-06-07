
module Sepomex  
  class Client
    def initialize
      states = RestClient.get 'http://sepomex.icalialabs.com/api/v1/states'
      json_states = JSON.parse(@states.body)
      @states = json_states["states"]
    end
    def get_states
      json_states = []
      @states.each do |state|
        new_state = Sepomex::State.new(state["name"])
        json_states.push(new_state)
      end
      json_states
    end
  end 
end 

module Sepomex  
  class State
    attr_reader :name
    def initialize(name)
      @name = name
    end
  end 
end 

client = Sepomex::Client.new
states = client.get_states
states.each do |state|  
  puts state.name
end