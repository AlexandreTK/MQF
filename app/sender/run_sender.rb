class RunSender

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