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
		# createQueue
		createReceiver
		executeReceiver
	end


	def createReceiver
		require_relative 'simple_receiver'
		@runReceiverInstance.createReceiver
		@q1 = MainQueue.new
		@sr = SimpleReceiver.new(@q1, @runReceiverInstance.getReceiver)
	end

	def executeReceiver
		#@runReceiverInstance.executeReceiver
		@sr.recvMsg
	end

end

# srr = SimpleRunReceiver.new("../../app/")
# srr.run