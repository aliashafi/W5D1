class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    count = 1
    self.inject(3) do |acc, el|
      if count.odd?
        acc *= el
        count += 1
      else
        acc += el
        count += 1
      end
    end
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
