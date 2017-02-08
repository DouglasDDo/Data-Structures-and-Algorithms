# Objective: Given two arays, return a new array containing elements that are in
# either one or the other but not both
# NOTE: This isn't a bit manipulation problem, despite the 'xor' in the name

def xor_diff(arr1, arr2)
  hashed = Hash.new(0)

  arr1.each do |el|
    hashed[el] = 'first'
  end

  arr2.each do |el|
    hashed[el] = hashed[el] == 'first' ?  'both' : 'second'
  end

  hashed.delete_if {|key,value| value == 'both'}
  hashed.keys
end

p xor_diff([1,2], [2,3])
