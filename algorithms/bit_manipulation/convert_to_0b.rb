# Objective: Convert a character to binary

def to_0b_int_single(char)
  # convert the arg into a string (will only convert first char if string.length > 1)
  # convert the char to its ASCII char code
  # convert the ASCII code into a string representing the binary format of that code
  # parse the integers to return the binary
  result = char.to_s.ord.to_s(2).to_i
end

def to_0b_int_multi(*args)
  result = args.map do |x|
    x.to_s.chars.map { |char| char.ord.to_s(2).to_i }
  end

  result.join.to_i
end

def to_8bit_str_single(char)

end

def to_8bit_str_multi(*args)

end

p to_0b_int_multi(123)
