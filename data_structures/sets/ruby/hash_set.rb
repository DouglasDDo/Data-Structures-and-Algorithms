# import monkey-patched hashing methods for String, Array, and Hash
require_relative '../../hashes/ruby/hashing_methods'

class HashSet
  attr_reader :count
  def initialize(buckets = 20)
    @store = Array.new(buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    return nil if include?(key)
    self[key.hash] << key
    @count += 1
    resize! if @count > num_buckets
    self
  end

  def remove(key)
    return nil unless include?(key)
    self[key.hash].delete(key)
    self
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  private

  def num_buckets
    @store.length
  end

  def [](key)
    @store[key % num_buckets]
  end

  def resize!
    old_store = @store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }

    old_store.flatten.each { |k| insert(k) }
  end
end
