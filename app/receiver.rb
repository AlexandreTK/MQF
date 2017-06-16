require_relative '../core/receiver/simple_receiver.rb'

class Receiver < SimpleReceiver



	def beforeRecvLoop(beforeParam)
		puts " [*] Waiting for messages.... "
	end

	# What to do with each message
	def duringRecvLoop(delivery_info, properties, body)
		puts " [x] The message received was: #{body}"
	end

end