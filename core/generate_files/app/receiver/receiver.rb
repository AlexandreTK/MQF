class AbstractReceiver
        def beforeRecvLoop
                raise "Non Implemented Error"
        end

        def duringRecvLoop(delivery_info, properties, body)
                raise "Non Implemented Error"
        end
end


class ConcreteReceiverExample1 < AbstractReceiver

        @sum

        def beforeRecvLoop
                puts " [*] Waiting for messages.... "
                @sum = 0
        end

        def duringRecvLoop(delivery_info, properties, body)
                puts " [x] The message received was: #{body}"
                @sum = @sum + body.to_i
                puts @sum.to_s
        end
end


class RunReceiver

        @recv

        def createReceiver
            @recv = ConcreteReceiverExample1.new
        end

        def getReceiver
                @recv
        end     

end
