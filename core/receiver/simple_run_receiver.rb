class SimpleRunReceiver 

	@runReceiverInstance
	@appFolderPath

	def initialize(appFolderPath)
		@appFolderPath = appFolderPath
		#puts "#{@appFolderPath}"
		#puts "#{File.dirname(@appFolderPath)}/receiver.rb"
		require "#{@appFolderPath}"
		require "#{File.dirname(@appFolderPath)}/receiver.rb"
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