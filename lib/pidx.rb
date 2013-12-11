# Example:
# pidWithName("nginx")
# 
# Just run on unix-like system

require "pidx/version"
require 'open3'

module Pidx

    # Return nil if not found else return pid number string.
    def pidWithName(name)
      if name == nil
        puts "Input a name like 'nginx'!"
        return '0'
      end
      cmd = "ps -ef | grep " + name
      f = open("|" + cmd)
      r = f.read()
  
      r = r.split("\n")[0];
  
      # Check keyword 'grep'
      k = r.scan(/grep/)
      if k.size > 0
        return nil
      end
  
      r = r.split(/\W{1,}/)[2];
  
    end

    # Kill pid of process name
    def killPidWithName(name)
      pid = pidWithName(name)
      if pid == nil
        puts name + " current not running!"
      else
        puts "kill pid :" + pid
        system('sudo kill ' + pid)  
      end
    end
end
