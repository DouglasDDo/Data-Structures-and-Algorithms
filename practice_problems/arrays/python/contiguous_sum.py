def contiguous_sum(arr):
    current_sum = 0
    current_max = arr[0]

    for current in arr:
        if current + current_sum >= current_sum:
            current_sum = current + current_sum
        else:
            current_sum = current

        if current_sum >= current_max:
            current_max = current_sum

    return current_max


print(contiguous_sum([1,2,3]))
