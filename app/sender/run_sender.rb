require_relative 'sender.rb'

# class MainSender < Main

# 	@q1.sendMsg('Hello From queue')

# end

q1 = MainQueue.new

r = Sender.new(q1)

r.sendMsg("Hi my friend, how are you doing")
