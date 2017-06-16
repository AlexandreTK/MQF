class SimpleRunSender


	@runSenderInstance
	@appFolderPath

	def initialize(appFolderPath)
		@appFolderPath = appFolderPath
		require_relative "#{@appFolderPath}sender/sender.rb"
		require_relative "#{@appFolderPath}sender/run_sender.rb"
		@runSenderInstance = RunSender.new
	end

	@sender = nil
	@message = nil

	def run
		createQueue
		createSender
		beforeSendMessage
		message
		sendMessage
		afterSendMessage
	end

	def createQueue
		@runSenderInstance.createQueue
	end

	def createSender
		@sender = @runSenderInstance.createSender
	end

	def message
		@message = @runSenderInstance.message
	end

	def beforeSendMessage
		# TODO: Check if @runSenderInstance has it
		# ie. Maybe use flags if this is a valid method...
	end

	def sendMessage
		@sender.sendMsg(@message)
	end

	def afterSendMessage
		# TODO: Check if @runSenderInstance has it
		# ie. Maybe use flags if this is a valid method...
	end	

end


# srr = SimpleRunSender.new("../../app/")
# srr.run
