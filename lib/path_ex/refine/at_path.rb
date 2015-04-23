module PathEx::Refine
  module AtPath

    refine Hash do
      def set_at(key, value)
        key = PathEx.key(key)

        if key.has_tail?
          (self[key.head.to_s] ||= {}).set_at(key.tail, value)
        else
          self[key.head.to_s] = value
        end
      end

      def at(*keys)
        key = PathEx.key(keys.join('.'))
        return self if key.empty?

        val = (self[key.head.to_s] || self[key.head.to_sym])

        return nil if val.nil?
        return val if !key.has_tail?

        val.at(key.tail)
      end
    end

    refine NilClass do
      def set_at(key, value)
        nil
      end

      def at(*keys)
        nil
      end
    end

    refine Object do
      def set_at(key, value)
        key = PathEx.key(key)

        if key.has_tail?
          # If the method doesn't exist, this will explode. OK for now.
          self.__send__(key.head.to_sym).set_at(key.tail, value)
        else
          self.__send__(:"#{key.head.to_s}=", value)
        end

      end

      def at(*keys)
        key = PathEx.key(keys.sum)
        return self if key.empty?

        begin
          self.__send__(key.head.to_sym).at(key.tail)
        rescue
          nil
        end
      end
    end

  end
end
