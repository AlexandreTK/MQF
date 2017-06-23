require_relative "../../config/mqf_conf.rb"

class CoreMQF

	include Config

        def configurations
                return Config.get
        end

        # TODO: Complement this class later.
end

