require_relative 'channel.rb'
class GenQueue < Channel

        @@q
        def initialize
                super()
                @@q = @@ch.queue(configurations[:queue_name])
        end

	def sendMsg(msg)
		@@ch.default_exchange.publish(msg, :routing_key => @@q.name)
		puts "Message Sent"
		@@conn.close
	end

end

# Get queue name from configuration file
#puts "#{configurations()[:queue_name]}"
q = GenQueue.new
q.sendMsg('Hello From queue')

