module PathEx

  # Dot-notation key for referencing nested data structures.
  #
  class Key
    SEPARATOR = "."

    attr_reader :head
    attr_reader :tail

    # Initializes a new key with an existing key or a SEPARATOR-delimited
    # string.
    #
    # @param [Key, String] path_or_key
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
          @tail = segments.empty? ? nil : Key.new(segments.join(SEPARATOR))
        end
      end
    end

    # Returns true if this key has more than one component
    #
    def has_tail?
      !@tail.nil?
    end

    def empty?
      head.nil?
    end

    def blank?
      empty?
    end

    # Concatenates one key with another.
    #
    # eg. Key.new("one.two") + Key.new("three")
    # => Key("one.two.three")
    #
    # @param [Key] other
    # @return key
    #
    def +(other)
      Key.new( [to_s, other.to_s].join(SEPARATOR) )
    end

    def ==(other)
      to_s == other.to_s
    end

    def <=>(other)
      to_s <=> other.to_s
    end

    def to_s
      return head if !has_tail?

      "#{head}#{SEPARATOR}#{tail.to_s}"
    end
  end
end
