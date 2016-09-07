class SizeableSet
  def initialize(buckets = 20)
    @store = Array.new(buckets){ Array.new }
  end

  def insert(num)
    self[num] << num if include?(num)
    display
    self
  end

  def remove(num)
    self[num].delete(num) if include?(num)
    display
    self
  end

  def include?(num)
    @store[num].include?(num)
  end

  def display
    puts @store
  end

  private

  def [](num)
    @store[num % @store.length]
  end
end
