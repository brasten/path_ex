module PathEx
  class Key
    SEPARATOR = "."

    attr_reader :head
    attr_reader :tail

    # Initializes a new key with an existing key or a SEPARATOR-delimited
    # string.
    #
    def initialize(path_or_key)
      if path_or_key.respond_to?(:head) && path_or_key.respond_to?(:tail)
        @head = path_or_key.head
        @tail = path_or_key.tail
      else
        path = path_or_key.to_s
        segments = path.nil? ? [] : path.split(SEPARATOR)

        unless segments.empty?
          @head = segments.shift
          @tail = segments.empty? ? nil : segments.join(SEPARATOR)
        end
      end
    end

    def has_tail?
      !@tail.nil?
    end

    def empty?
      head.nil?
    end

    def blank?
      empty?
    end

    def +(other)
      [to_s, other.to_s].join(SEPARATOR)
    end

    def to_s
      [head, tail].compact.join(SEPARATOR)
    end
  end
end
