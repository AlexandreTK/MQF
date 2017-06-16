# Refactor later

# class Commands
# 	def execute
# 		raise "Not Implemented Error"
# 	end
# end

ARGV.each do|a|
  puts "Argument: #{a}"
end

dirname = File.expand_path(File.dirname(File.dirname(__FILE__)))
puts dirname

if ((ARGV[0] == "run") and (ARGV[1] =="sender"))
	puts "Running Sender"

	# Require the classes dynamically...
	# Instantiate it
	# Call the method Run
end

if ((ARGV[0] == "run") and (ARGV[1] =="receiver"))
	puts "Running Receiver"

	# Require the classes dynamically...
	# Instantiate it
	# Call the method Run
end

if ((ARGV[0] == "generate") and (ARGV[1] =="all"))
	puts "Generating Sender and Receiver"

	# Require the classes dynamically...
	# Instantiate it
	# Call the method Run
end
