require_relative '../base_comunication/main_queue.rb'

class SimpleSender
	@queue
	@channel
	@connection
	@senderInstance

	def initialize(queue, senderInstance)
		@queue = queue.getQueue
		@channel = queue.getChannel
		@connection = queue.getConnection
		@senderInstance = senderInstance
	end

	def sendMsg(msg)
		@channel.default_exchange.publish(msg, routing_key: @queue.name)
		@connection.close
	end


end

class SimpleRunSender

	@simpleSender
	@runSenderInstance
	@appFolderPath


	@message = nil

	def initialize(appFolderPath)
		@appFolderPath = appFolderPath
		require "#{@appFolderPath}"
		# User Implemented Sender
		@runSenderInstance = RunSender.new
	end

	def run
		#createQueue
		createSender
		beforeSendMessage
		sendMessage
		afterSendMessage
	end

	def createSender
		# Creates the user Sender
		@runSenderInstance.createSender

		@q1 = MainQueue.new
		@simpleSender = SimpleSender.new(@q1, @runSenderInstance.getSender)
	end


	def beforeSendMessage
		@runSenderInstance.getSender.beforeSendMessage
	end

	def sendMessage
		message = @runSenderInstance.getSender.message
		@simpleSender.sendMsg(message)
	end

	def afterSendMessage
		@runSenderInstance.getSender.afterSendMessage
	end	

end