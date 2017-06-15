require_relative 'core.rb'
require 'bunny'

class Connection < CoreMQF
	
	@@conn
	
	def initialize
		@@conn = Bunny.new(:hostname => "localhost")
		@@conn.start
		super()
	end

end
