module MQF_MODULE
	class MQF_MODULE_CLASS
		def printHello
			puts "Hello, first fw - MODULE_CLASS"
		end
	end

	def self.printHello
		puts "Hello, first fw - MODULE"
	end

	def printHelloInclude
		puts "Hello, first fw - MODULE2"
	end
end

class MQF_CLASS
	def printHello
		puts "Hello, first fw - CLASS"
	end
end

class INCLUDE_MODULE
	include MQF_MODULE
end

mqf = MQF_MODULE::MQF_MODULE_CLASS.new
mqf.printHello

MQF_MODULE.printHello

mqc = MQF_CLASS.new
mqc.printHello

INCLUDE_MODULE.new.printHelloInclude




#  # Or.. make all of the "static"
#  class << self
#     def write_file; ...
#     def commit_file; ...
#  end
