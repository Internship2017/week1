

module Sepomex
  class Client
    states = RestClient.get 'http://sepomex.icalialabs.com/api/v1/states'
    get_states = JSON.parse(states.body)
  end
end

module Sepomex
  class State
    def initialize()
      @name = json_states["name"]
  end
end

client = Sepomex::Client.new
states = client.get_states

states.each do |state|
  puts state.name
end