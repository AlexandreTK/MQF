# Refactor later

# class Commands
# 	def execute
# 		raise "Not Implemented Error"
# 	end
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

def createConfigFile(path, framework_generator_path)
	out_file = File.new(path, "w")

	out_file.puts("module Config")
	out_file.puts("	@config = {")
	out_file.puts("		framework_path: '#{framework_generator_path}',")
	out_file.puts("	}")
	out_file.puts("	def self.get")
	out_file.puts("		return @config")
	out_file.puts("	end")
	out_file.puts("end")

	# module Config
	# 	@config = {
	# 		framework_path: "hello"

	# 	}
	# 	def self.get
	# 		return @config
	# 	end	
	# end

	out_file.close
end

if ((ARGV[0] == "new") and (ARGV[1] != nil))

	puts "Generating new project"

	core_path = "#{File.expand_path(File.dirname(File.dirname(__FILE__)))}"
	project_path = "#{File.expand_path('.')}"
	
	project_generator_path = core_path+"/generate_files/project/."
	project_name_path = project_path + "/" + ARGV[1]	
	project_config_path = project_name_path + "/config/mqf_conf.rb"

	puts project_generator_path
	puts project_name_path
	
	require 'fileutils'
	FileUtils.cp_r project_generator_path, project_name_path
	createConfigFile(project_config_path, core_path+"/commands/mqf.rb")
end



if ((ARGV[0] == "generate") and (ARGV[1] =="all"))

	puts "Generating Sender and Receiver"

	core_path = "#{File.expand_path(File.dirname(File.dirname(__FILE__)))}"
	project_path = "#{File.expand_path('.')}"
	
	app_generator_path = core_path + "/generate_files/app/."
	app_name_path = project_path + "/app"

	puts app_generator_path
	puts app_name_path

	require 'fileutils'
	FileUtils.cp_r app_generator_path, app_name_path
end
