require_relative 'channel.rb'
class MainQueue < Channel

        @@q
        def initialize
                super()
                @@q = @@ch.queue(configurations[:queue_name])
        end

        def getQueue
        	return @@q
        end
        
        def getChannel
        	return @@ch
        end

       	def getConnection
    		return @@conn
    	end

	# def sendMsg(msg)
	# 	@@ch.default_exchange.publish(msg, routing_key: @@q.name)
	# 	puts "Message Sent"
	# 	@@conn.close
	# end

end


# q = MainQueue.new
# q.sendMsg('Hello From queue')

