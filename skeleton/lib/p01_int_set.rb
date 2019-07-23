class MaxIntSet
  attr_reader :store

  def initialize(max)
    @max = max
    @store = Array.new(max, false)

  end

  def insert(num)
    if num < 0 || num > @max 
      raise 'Out of bounds'
    end 
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
 
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    @store.length
    @store[num % @store.length] << num
  end

  def remove(num)
    @store[num % @store.length].delete(num)
  end

  def include?(num)
     @store[num % @store.length].include?(num)
  end

  private

  def [](num)
    @store[num]
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if !include?(num)
      @store[num % num_buckets] << num 
      @count += 1
    end 
    if @count >= num_buckets
      resize!
    end
  end

  def remove(num)
    if include?(num)
      @store[num % num_buckets].delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @store[num % num_buckets].include?(num)
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
    dup_store = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    @count = 0
    dup_store.each do |sub_store|
      sub_store.each do |num|
        insert(num)
      end
    end
    p @store
  end



end
