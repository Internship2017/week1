
module Sepomex
  class Client
  	URL = "http://sepomex.icalialabs.com/api/v1/".freeze

  	def states
  		@states ||= resource("states").map { |state_attrs| Sepomex::State.new(state_attrs) }
  	end

  	def zip_codes
  		@zip_codes ||= resource("zip_codes").map { |zip_code_attrs| Sepomex::ZipCode.new(zip_code_attrs) }
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
  	attr_reader :id, :name, :cities_count

  	def initialize(attrs = {})
  		@id = attrs["id"]
  		@name = attrs["name"]
  		@cities_count = attrs["cities_count"]
  	end
  end

  class ZipCode
  	attr_reader :id, :code

  	def initialize(attrs = {})
  		@id = attrs["id"]
  		@code = attrs["d_codigo"]
  	end
  end
end

client = Sepomex::Client.new
states = client.states
zip_codes = client.zip_codes

states.each do |state|
  puts "#{state.id} #{state.name} #{state.cities_count}"
end

zip_codes.each do |zip_code|
  puts "#{zip_code.id} #{zip_code.code}"
end