require 'path_ex'

class Hash

  def at_path(*keys)
    key = PathEx.key(keys.join('.'))
    return self if key.empty?

    val = (self[key.head.to_s] || self[key.head.to_sym])

    return nil if val.nil?
    return val if !key.has_tail?

    val.at_path(key.tail)
  end

end
