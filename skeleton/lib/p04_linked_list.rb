class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  def initialize
    @head = Node.new()
    @tail = Node.new()
    @head.next = @tail
    @tail.prev = @head
    @list = [@head, @tail]
  end

  def [](i)
    @list[1...-1].each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @list[1]
  end

  def last
    @list[-2]
  end

  def empty?
    @list.length == 2
    #<- head [node] tail ->
  end

  def get(key)
  end

  def include?(key)
    @list.each do |node|
      return true if node.key == key
      # p node.val
      # p node.key
    end
    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    new_node.prev = last
    new_node.next = @tail
    @list = @list[0..-2].concat([new_node], [@list[-1]])
    @tail.prev = new_node
    @head.next = first
  end

  def update(key, val)
    if include?(key)
       self.each do 
        |node|
        node.key == key
      end
    end
  end

  def remove(key)
  end

  def each(&prc)
    prc ||= Proc.new { |x| x }
    # output = @list.map { |node| node.val }
    i = 1
    while i < @list.length - 1
      prc.call(@list[i])
      i += 1
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
