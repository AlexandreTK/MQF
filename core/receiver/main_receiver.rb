require_relative '../main_queue.rb'

class MainReceiver
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
		  puts " [*] Waiting for messages. To exit press CTRL+C"
		  @queue.subscribe(:block => true) do |delivery_info, properties, body|
		    puts " [x] Received #{body}"
		  end
		rescue Interrupt => _
		  @connection.close

		  exit(0)
		end
	end

end





q = MainQueue.new

s = MainReceiver.new(q)
s.recvMsg
