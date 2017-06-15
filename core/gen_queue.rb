require_relative 'channel.rb'
class GenQueue < Channel

        @@q
        def initialize(queueName)
                super()
                @@q = @@ch.queue(queueName)
        end

	def sendMsg(msg)
		@@ch.default_exchange.publish(msg, :routing_key => @@q.name)
		puts "Message Sent"
		@@conn.close
	end

end

# Get queue name from configuration file
q = GenQueue.new('hello')
q.sendMsg('Hello From queue')
