class RunSender

	def createQueue
		@q1 = MainQueue.new
	end

	# must return the created sender
	def createSender
		@sender = Sender.new(@q1)
	end

	# Must return the message to be sent
	def message # Should it be in the sender or run_sender?
		"3"
	end

	# def beforeSendMessage
	# end
	# def afterSendMessage
	# end	

end
