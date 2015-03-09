require "path_ex/version"

module PathEx

  def self.key(path_or_key)
    Key.new(path_or_key)
  end
  
end

require 'path_ex/key'
