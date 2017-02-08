# Objective: Compress a string, using the char and then the number of times it's
# repeated in succesion. Example: heeelllloooo -> he3l4o4. Return the original if
# the compressed version isn't shorter in length

def compress_str(str)
  # Cover non-string args
  raise ArgumentError, "Non-string argument(s) used." unless str.is_a?(String)
  # If the string is empty or is less than 3, there's no way to reduce its size
  # so return the str
  return str if str.length <= 2

  # Set the count to 1 since if the char is in the string even once, it's still counted
  count = 1
  # Initialize previous with the first char
  prev = str[0]
  # Keep track of the final result
  result = ''

  # Start at the second char and iterate down to the end
  # There will always be a previous starting this way
  (1 ... str.length).each do |i|
    # If the current char matches the previous, increment count
    if prev == str[i]
      count += 1
    else
    # If the current is different from previous
      # Add the previous to the result
      # The next iteration will check for multiples of the current char
      result += prev
      # If there was a repeated char, append the count, otherwise append a blank
      result += count > 1 ? count.to_s : ''
      # Set previous to the current for the next iteration to work with
      prev = str[i]
      # Reset the count to 1
      count = 1
    end
  end

  # Catch either the last char or the last set of repeating chars
  result += prev
  result += count > 1 ? count.to_s : ''
  # Return the shorter of the result and the original
  result.length >= str.length ? str : result
end

p compress_str('food')
