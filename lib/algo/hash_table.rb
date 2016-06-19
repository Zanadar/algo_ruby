class HashTable
  def initialize(*args)
    @table = []
    if args.length % 2 != 0
      raise ArgumentError
    end
    args.each_slice(2) do |k, v|
      spot = hash(k)
      @table[spot] = v
    end
  end

  def []=(key, value)
    spot = hash(key)
    @table[spot] = value
  end

  def [](key)
    spot = hash(key)
    @table[spot]
  end

  def hash(key)
    (key[0].ord * 100) + key[1].ord
  end
end
