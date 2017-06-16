require_relative 'receiver.rb'
require_relative '../../core/receiver/simple_run_receiver.rb'

class RunReceiver < SimpleRunReceiver

	def createQueue
		@q1 = MainQueue.new
	end

	def createReceiver
		@recv = Receiver.new(@q1)
	end

	def executeReceiver
		@recv.recvMsg
	end

end


r = RunReceiver.new
r.run
# q1 = MainQueue.new

# r = Receiver.new(q1)

# r.recvMsg
