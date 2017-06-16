class RunReceiver

        def createQueue
                @q1 = MainQueue.new
        end

        def createReceiver
                @recv = Receiver.new(@q1)
        end

        def executeReceiver
                @recv.recvMsg
        end

end
