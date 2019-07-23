class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if !include?(key)
      @store[key.hash % num_buckets] << key
      @count += 1
    end
    if count > num_buckets
      resize!
    end
  end

  def include?(key)
    @store[key.hash % num_buckets].include?(key)
  end

  def remove(key)
    @count -= 1 if include?(key)
    @store[key.hash % num_buckets].delete(key)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end

  def resize!
    temp = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    temp.each do |bucket|
      bucket.each do |ele|
        insert(ele)
      end
   end
  end
end
