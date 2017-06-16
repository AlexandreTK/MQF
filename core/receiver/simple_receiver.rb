require_relative '../base_comunication/main_queue.rb'

class SimpleReceiver
	@queue
	@channel
	@connection

	def initialize(queue)
		@queue = queue.getQueue
		@channel = queue.getChannel
		@connection = queue.getConnection
	end

	def recvMsg
		begin
		  beforeRecvLoop(nil)
		  @queue.subscribe(:block => true) do |delivery_info, properties, body|

		    duringRecvLoop(delivery_info, properties, body)

		  end
		rescue Interrupt => _
		  @connection.close

		  exit(0)
		end
	end

	def beforeRecvLoop(beforeParam)
		# puts " [*] Waiting for messages. To exit press CTRL+C"
	end

	# TODO: Create a Arg class... (so that we can do more things with this method)
	def duringRecvLoop(delivery_info, properties, body)
		# puts " [x] Received #{body}"
		raise "Not Implemented Error"
	end

end





# q = MainQueue.new

# s = SimpleReceiver.new(q)
# s.recvMsg
