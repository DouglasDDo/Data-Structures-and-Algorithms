# Hashing methods monkey-patched into the Array, String, and Hash classes
class Array
  def hash
    # Use inject on Array, set initial value to 0
    # For each el in Array:
    # Run Fixnum.hash method on both the el and its index
    # XOR the sum of the hashed values with memo
    # return the final memo value at the end, representing the entire Array, hashed
    self.each_with_index.inject(0) { |memo, (el, i)|
      (el.hash + i.hash) ^ memo
    }
  end
end

class String
  # For each char in the String:
  # Call String.ord to convert the char to a Fixnum
  # then call Fixnum.hash on the ord value
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  def hash
    self.to_a.sort_by(&:hash).hash
  end
end
