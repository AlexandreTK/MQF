module Config
	@config = Hash.new	
	@config = {
		queue_name: "hello"
	}

	def self.get
		return @config
	end

end
