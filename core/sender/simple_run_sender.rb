class SimpleRunSender

	@sender = nil
	@message = nil
	def run
		createQueue
		@sender = createSender
		beforeSendMessage
		@message = message
		sendMessage(@sender, @message)
		afterSendMessage
	end

	def createQueue
		raise "Not Implemented"
	end

	def createSender
		raise "Not Implemented"
	end

	def message
		raise "Not Implemented"
	end

	def beforeSendMessage

	end

	def sendMessage(sender,msg)
		sender.sendMsg(msg)
	end

	def afterSendMessage

	end	

end
