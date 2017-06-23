require_relative '../base_comunication/main_queue.rb'

class SimpleReceiver
	@queue
	@channel
	@connection
	@receiverInstance

	def initialize(queue, receiverInstance)
		@queue = queue.getQueue
		@channel = queue.getChannel
		@connection = queue.getConnection
		@receiverInstance = receiverInstance
	end

	def recvMsg
		begin
		  beforeRecvLoop
		  @queue.subscribe(:block => true) do |delivery_info, properties, body|

		    duringRecvLoop(delivery_info, properties, body)

		  end
		rescue Interrupt => _
		  @connection.close

		  exit(0)
		end
	end

	def beforeRecvLoop
		@receiverInstance.beforeRecvLoop
	end

	def duringRecvLoop(delivery_info, properties, body)
		@receiverInstance.duringRecvLoop(delivery_info, properties, body)
	end

end



class SimpleRunReceiver 

	@runReceiverInstance
	@appFolderPath

	def initialize(appFolderPath)
		@appFolderPath = appFolderPath
		require "#{@appFolderPath}"
		@runReceiverInstance = RunReceiver.new

	end

	def run
		# createQueue
		createReceiver
		executeReceiver
	end


	def createReceiver
		@runReceiverInstance.createReceiver
		@q1 = MainQueue.new
		@sr = SimpleReceiver.new(@q1, @runReceiverInstance.getReceiver)
	end

	def executeReceiver
		#@runReceiverInstance.executeReceiver
		@sr.recvMsg
	end

end