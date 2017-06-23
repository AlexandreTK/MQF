class AbstractSender

	def beforeSendMessage	
	end

	# Must return the message to be sent
	def message
		raise "Not implemented Exception"
	end

	def afterSendMessage	
	end	
end


class ConcreteSenderExample1 < AbstractSender

	def beforeSendMessage
		puts "*** This message shows up before sending the message ***"
	end

	# Must return the message (STRING) to be sent
	def message 
		"#{Random.rand(11)}"
	end

	def afterSendMessage
		puts "*** This message shows up after sending the message ***"
	end	
end


class RunSender
	@sender

	def createSender
		@sender = ConcreteSenderExample1.new
	end

	def getSender
		return @sender
	end

end
