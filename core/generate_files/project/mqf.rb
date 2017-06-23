require_relative "config/mqf_conf.rb"

class RunCommands

	include Config
	def configurations
	        return Config.get
	end

	def execute
		load "#{configurations[:framework_run_path]}"
	end
end

RunCommands.new.execute
