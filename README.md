# PigeonMQF

PigeonMQF is a proof of concept of new features that might be implemented to the Pigeon Framework.

Video: https://youtu.be/ArVD4FF0hAU

## What is the Pigeon Framework?

It's a framework developed in ruby that makes it easier for developers to use RabbitMQ (message broker). This framework let's the developer focus on the implementation of each software component/service functionality rather than on the communication between them.

## Dependencies

### Ruby
Implemented on ruby 2.4.0p0

### RabbitMQ
RabbitMQ is a message broker: it accepts and forwards messages. You can think about it as a post office: when you put the mail that you want posting in a post box, you can be sure that Mr. Postman will eventually deliver the mail to your recipient.In this analogy, RabbitMQ is a post box, a post office and a postman.

A producer is a user application that sends messages. A queue is a buffer that stores messages. A consumer is a user application that receives messages.

### Bunny
Bunny is a RabbitMQ client that focuses on ease of use. It is feature complete, supports all recent RabbitMQ features and does not have any heavyweight dependencies.

## How to install
1. Install ruby
2. Install RabbitMQ
3. Install the Bunny gem
4. Git clone https://github.com/DSW-1-2017/PigeonMQF/
5. Save the framework folder where you want

And that's it!

## How to use

1. Go to the folder where you want to create your application
2. Open the application folder
2. Run the following command to create a new project.
  
  > ruby  <path_to_framework_folder/core/commands/mqf.rb>   new   <project_name>
3. Go to the project root directory, and run the command:
  
  > ruby <path_to_mqf.rb> generate simple
4. Now the "receiver.rb" and "sender.rb" files will be created in the app folder.
5. Edit the "receiver.rb" and "sender.rb" files
6. Run the receiver by running the command:
  
  > ruby <path_to_mqf.rb> run receiver <path_to_receiver.rb>
7. Run the sender by running the command:
  
  > ruby <path_to_sender.rb> run sender <path_to_sender.rb>


## Avaliable commands

Before each command, you should type:
  
  > ruby <path_to_mqf.rb>
  - After creating the project, you may use the "mqf.rb" that is in the application directory or the one in the framework directory, there is no difference.
  - The "mqf.rb" in the framework directory is located at "core/commands/mqf.rb:
  
* new <project name> 
  - Creates a new project with the specified name
* generate simple
  - Generates a simple receiver and sender. Run this command in the root of the project folder.
* run receiver <path_to_the_receiver>
  - The receiver is in the app folder. You should specify the path to it.
* run sender <path_to_the_sender>
  - The sender is in the app folder. You should specify the path to it.


## Example

When generating the "receiver.rb" and "sender.rb", you will be provided with an default example. You might want to use it to better understand the framework.

* Receiver - adds 2 numbers:
  - You should implement at least the "beforeRecvLoop" and "duringRecvLoop" functions.

	```
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
	```

* Sender - sends a random number
  - You should implement at least the "message" function
  
  	```
	class ConcreteSenderExample1 < AbstractSender
		def beforeSendMessage
			puts "*** This message shows up before sending the message ***"
		end

		# Must return the message (STRING) to be sent
		def message 
			"#{Random.rand(11)}"
		end

		def afterSendMessage
			puts "*** This message shows up after sending the message ***"
		end	
	end
	```

RabbitMQ: https://www.rabbitmq.com/

Bunny: https://github.com/ruby-amqp/bunny
