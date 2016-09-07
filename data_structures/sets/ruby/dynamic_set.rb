class DynamicSet
  attr_reader :count

  def initialize(buckets = 20)
    @store = Array.new(buckets){ Array.new }
    @count = 0
  end

  def insert(num)
    return nil if include?(num)
    @store[num] << num
    @count += 1
    resize! if @count > num_buckets
  end

  def remove(num)
    self[num].delete(num) if include?(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def num_buckets
    @store.length
  end

  def [](num)
    @store[num % num_buckets]
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2){ Array.new }

    old_store.flatten.each { |n| insert(num) }
  end

end
