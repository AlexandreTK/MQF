class SimpleRunReceiver 

	@runReceiverInstance
	@appFolderPath

	def initialize(appFolderPath)
		@appFolderPath = appFolderPath
		require_relative "#{@appFolderPath}receiver/receiver.rb"
		require_relative "#{@appFolderPath}receiver/run_receiver.rb"
		@runReceiverInstance = RunReceiver.new

	end

	def run
		createQueue
		createReceiver
		executeReceiver
	end

	def createQueue
		@runReceiverInstance.createQueue
	end

	def createReceiver
		@runReceiverInstance.createReceiver
	end

	def executeReceiver
		@runReceiverInstance.executeReceiver
	end

end

# srr = SimpleRunReceiver.new("../../app/")
# srr.run