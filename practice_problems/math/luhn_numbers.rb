# The Luhn test has 5 steps:
# 1. Take the digits and reverse them
# 2. Take all odd ordered digits and sum them
# 3. Take all even ordered digits and double them
# 4. If any of the doubled even ordered digits are > 10, break them down into
#    single digits and then sum up all of the digits in the even ordered collection
# 5. Take the sums from Step 2 and Step 4 and add them together. Check this final
#    sum's one-place digit and return true if that digit is 0, false otherwise
def passes_luhn?(str)
  # Cover non-string args
  raise ArgumentError, "Non-string argument(s) used." unless str.is_a?(String)

  # Reverse the str and break it down into chars to work with individual digits
  digits = str.reverse.chars
  # Keep vars to track the sum of odd and even elements in digits
  odd_sum = 0
  even_sum = 0
  # Keep an empty array for doubled even ordered digits
  doubled_evens = []

  digits.each_with_index do |dig, i|
    # Add a 1 to the index, i, and check if it's even or odd
    if (i + 1) % 2 != 0
      # Odd ordered digits just get directly added to the odd_sum var
      odd_sum += dig.to_i
    else
      # Even ordered digits are multiplied by 2 before being pushed into the array
      doubled_evens << dig.to_i * 2
    end
  end

  # Go through all the doubled even ordered digits
  doubled_evens.each do |num|
    # If int division of the number is greater than 0, it means the number is 2+ digits
    if num/10 != 0
      # Break the number into single digits and add those to even_sum
      num.to_s.chars.each do |dig|
        even_sum += dig.to_i
      end
    else
      # The number is a single digit number and can be added directly to even_sum
      even_sum += num
    end
  end

  # Add the sums together and mod by 10 to check if the last digit is 0
  (odd_sum + even_sum) % 10 == 0
end
