# Objective: Replace all spaces in a string with '%20'

def replace_spaces(str)
  raise ArgumentError, "Non-string argument(s) used." unless str.is_a?(String)

  str.chars.map { |char| char == ' ' ? '%20' : char }.join
end

# Iterative way
def replace_spaces_no_map(str)
  return false unless str.is_a?(String)

  result = ''

  (0 ... str.length).each do |i|
    result += str[i] == ' ' ? '%20' : str[i]
  end

  result
end
