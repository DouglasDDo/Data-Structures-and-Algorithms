# Objective: Given an array, return the longest subsequence that has its
# elements increasing as you move forward.

def longest_increasing_subseq(arr)
  n = arr.size
  lis = Array.new(n, 1)

  (0 ... n).each do |i|
    (0 ... i).each do |j|
      if arr[i] > arr[j] && lis[j] + 1 > lis[i]
        lis[i] = lis[j] + 1
      end
    end
  end

  max_len = 0

  (1 ... n).each do |k|
    max_len = lis[k] if max_len < lis[k]
  end

  max_len
end

p longest_increasing_subseq [50, 3, 10, 7, 40, 80, 13]
p longest_increasing_subseq [10, 22, 9, 33, 21, 50, 41, 60]
