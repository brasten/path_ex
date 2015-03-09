class Object

  def at_path(*keys)
    key = PathEx.key(keys.sum)
    return self if key.empty?

    begin
      self.__send__(key.head.to_sym).at_path(key.tail)
    rescue
      nil
    end
  end

end
