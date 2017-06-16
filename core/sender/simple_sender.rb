require_relative '../base_comunication/main_queue.rb'

class SimpleSender
	@queue
	@channel
	@connection

	def initialize(queue)
		@queue = queue.getQueue
		@channel = queue.getChannel
		@connection = queue.getConnection
	end

	def sendMsg(msg)
		@channel.default_exchange.publish(msg, routing_key: @queue.name)
		@connection.close
	end

end

# q = MainQueue.new

# s = SimpleSender.new(q)
# s.sendMsg('Hello From queue')