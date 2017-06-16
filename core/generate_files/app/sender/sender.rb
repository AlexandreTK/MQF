require_relative '../../config/mqf_conf.rb'
c = Config.get[:framework_core_path]
require "#{c}/sender/simple_sender.rb"

# Better if using INHERITANCE (like now) 
#     or          COMPOSITION (no need to use include)
#     instantiate this class and use it in the main one.

class Sender < SimpleSender


end
