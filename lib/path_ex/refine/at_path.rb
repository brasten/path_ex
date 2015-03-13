module PathEx::Refine
  module AtPath

    refine Hash do
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
      def at(*keys)
        nil
      end
    end

    refine Object do
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
