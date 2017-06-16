# Better if using INHERITANCE (like now) 
#     or          COMPOSITION (no need to use include)
#     instantiate this class and use it in the main one.

require_relative '../../core/receiver/simple_receiver.rb'

class Receiver < SimpleReceiver


	@sum

	def beforeRecvLoop(beforeParam)
		puts " [*] Waiting for messages.... "
		@sum = 0
	end

	# What to do with each message
	def duringRecvLoop(delivery_info, properties, body)
		puts " [x] The message received was: #{body}"
		@sum = @sum + body.to_i
		puts @sum.to_s
	end

end