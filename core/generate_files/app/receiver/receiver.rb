class AbstractReceiver
        def beforeRecvLoop
                raise "Not Implemented Error"
        end

        def duringRecvLoop(delivery_info, properties, body)
                raise "Not Implemented Error"
        end
end


class ConcreteReceiverExample1 < AbstractReceiver

        @val1
        @val2
        @counter

        def beforeRecvLoop
                puts " [*] Waiting for messages... "
                @val1 = 0
                @val2 = 0
                @counter = 0
        end

        def duringRecvLoop(delivery_info, properties, body)

                if (@counter % 2 == 0)
                        puts " [x] Value 1 is: #{body}"
                        @val1 = body.to_i
                end

                if (@counter % 2 == 1)
                        puts " [x] Value 2 is: #{body}"
                        @val2 = body.to_i
                end

                if (@val1 != 0 and @val2 != 0)
                        sum = @val1 + @val2
                        puts " [***] The sum #{@val1}+#{@val2} is: #{sum}"
                        @val1 = 0
                        @val2 = 0
                end

                @counter = @counter + 1
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
