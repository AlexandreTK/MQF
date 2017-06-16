require_relative 'connection.rb'

class Channel < Connection

	@@ch


	def initialize
		super()
		@@ch = @@conn.create_channel
	end


end
