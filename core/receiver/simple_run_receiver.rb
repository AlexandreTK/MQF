class SimpleRunReceiver 

	def run
		createQueue
		createReceiver
		executeReceiver
	end

	def createQueue
		raise "Not Implemented"
	end

	def createReceiver
		raise "Not Implemented"
	end

	def executeReceiver
		raise "Not Implemented"
	end

end
