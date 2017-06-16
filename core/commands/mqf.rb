# Refactor later

# class Commands
# 	def execute
# 		raise "Not Implemented Error"
# 	end
# end



dirname = File.expand_path(File.dirname(File.dirname(__FILE__)))

# puts dirname
# ARGV.each do|a|
#   puts "Argument: #{a}"
# end

if ((ARGV[0] == "run") and (ARGV[1] =="sender"))
	puts "Running Sender"

	require_relative "../sender/simple_run_sender.rb"
	srs = SimpleRunSender.new("../../app/")
	srs.run


end

if ((ARGV[0] == "run") and (ARGV[1] =="receiver"))
	puts "Running Receiver"

	require_relative "../receiver/simple_run_receiver.rb"
	srr = SimpleRunReceiver.new("../../app/")
	srr.run

end

if ((ARGV[0] == "generate") and (ARGV[1] =="all"))
	puts "Generating Sender and Receiver"

end
