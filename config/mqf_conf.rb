module Config

	@config = {
		queue_name: "hello",
		broker_ip: "localhost"

	}


	def self.get
		return @config
	end
end

#IDEAS
	# - host_port   -> default=5672
	# - Remove queue from configuration to allow MULTIPLE queues (different names)
	#   OR insert the queue in the config file. ie: mqf new queue <queue_name>...