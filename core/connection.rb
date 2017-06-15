require_relative 'core.rb'
require 'bunny'

class Connection < CoreMQF

	@@conn
	

	def initialize
		@@conn = Bunny.new(:hostname => configurations[:broker_ip])
		@@conn.start
		super()
	end

end
