def get_num_coins(coins_arr, target)
  best_count = nil

  coins_arr.each_with_index do |_, i|
    coins_chunk = coins_arr[i..-1]
    loop_count  = find_op_count(target, coins_chunk)

    best_count = loop_count if best_count.nil?
    best_count = loop_count if best_count > loop_count
  end

  best_count
end

# Greedy version
def greedy_get_num_coins(coins, target)
  ncoins = 0
  coins.sort.reverse.each do |coin|
    ncoins +=  target / coin
    target = target % coin
  end
  ncoins
end

# Find optimal combination
# NOTE: Not working. In test below, gives 5, should be 2
def find_op_count(single_target, single_array)
  return 0 if single_array.empty?
  return 1 if single_array.first == single_target

  coin_count = 0
  remainder = 0

  single_count = single_target/single_array.first
  remainder = single_target - (single_count * single_array.first)

  single_array.shift
  coin_count += single_count + find_op_count(remainder, single_array)

  coin_count
end

p greedy_get_num_coins([10,7,1], 14)
p get_num_coins([10,7,1], 52)
# p find_op_count(14, [10,7,1])
