require 'rubygems'
require 'rest-client'
require 'json'

module Sepomex
  class Client
    attr_accessor :states
    def initialize()
      raw_states = RestClient.get 'http://sepomex.icalialabs.com/api/v1/states'
      json_states = JSON.parse(raw_states)
      @states = json_states["states"]
    end

    def get_states
      @states.map do |state|
        Sepomex::State.new(state["name"], state["cities_count"])
      end
    end
  end
end

module Sepomex
  class State
    attr_accessor :id, :name, :cities_count

    def initialize(id, name, cities_count)
      @id = id
      @name = name
      @cities_count = cities_count
    end
  end
end

client = Sepomex::Client.new
states = client.get_states

states.each do |state|
  puts state.name
end
