require_relative 'receiver.rb'


# class MainReceiver < Main

# 	def run
# 		s = SimpleReceiver.new(@q1)
# 		s.recvMsg
# 	end

# end

q1 = MainQueue.new

r = Receiver.new(q1)

r.recvMsg
