require 'rest-client'
require 'json'

module Sepomex
  class Client

    URL = "http://sepomex.icalialabs.com/api/v1/".freeze

    def states
      @states ||= resource("states").map { |state_attrs| Sepomex::State.new(state_attrs) }
    end

    def zipcodes
      @zipcodes ||= resource("zip_codes").map { |zipcode_attrs| Sepomex::ZipCode.new(zipcode_attrs) }

      end

    private
    def resource(resource)
      raw_resource = RestClient.get "#{URL}#{resource}"
      JSON.parse(raw_resource.body)[resource]
    end

  end
end



module Sepomex

  class State
    attr_accessor :id, :name, :cities_count

    def initialize(attrs = {})
      @id = attrs["id"]
      @name = attrs["name"]
      @cities_count = attrs["cities_count"]

    end
  end

  class ZipCode
    attr_accessor :id, :code
    def initialize(attrs = {} )
      @id = attrs["id"]
      @code = attrs["d_codigo"]
    end

    end

  end

########

client = Sepomex::Client.new
states = client.states
zip_codes = client.zipcodes

states.each do |state|
  puts state.name
end

zip_codes.each do |zipcode|
  puts "#{zipcode.id} - #{zipcode.code}"
end