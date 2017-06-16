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
end