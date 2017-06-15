require_relative 'core.rb'
require 'bunny'

class Connection < CoreMQF
	
	@@conn
	
	def initialize
		@@conn = Bunny.new(:hostname => "localhost")
		@@conn.start
	end


	#puts "testing: " + GLOBAL_VAR_1

end


