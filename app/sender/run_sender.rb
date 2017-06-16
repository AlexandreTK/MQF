require_relative 'sender.rb'
require_relative '../../core/sender/simple_run_sender.rb'

class RunSender < SimpleRunSender

	def createQueue
		@q1 = MainQueue.new
	end

	# must return the created sender
	def createSender
		@sender = Sender.new(@q1)
	end

	# Must return the message to be sent
	def message
		"3"
	end

	# def beforeSendMessage
	# end
	# def afterSendMessage
	# end	

end

r = RunSender.new
r.run

# q1 = MainQueue.new

# r = Sender.new(q1)

# r.sendMsg("3")


