# Fixed length Set with chainable methods
class FixedSet
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    validate!(num)
    return nil if @store[num]
    @store[num] = true
    display
    self
  end

  def remove(num)
    validate!(num)
    return nil unless include?(num)
    @store[num] = false
    display
    self
  end

  def include?(num)
    validate!(num)
    @store[num]
  end

  # Displays current store as an array with numeric values
  def display
    puts @store.map.with_index { |e, i| i if e }.compact
  end

  private

  def validate!(num)
    raise "The number #{num} is out of bounds." if num.between?(0, @store.length - 1)
  end
end
