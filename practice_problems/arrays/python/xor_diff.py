def xor_diff(arr1, arr2):
    dict = {}

    for el1 in arr1:
        dict[el1] = 'a'

    for el2 in arr2:
        check = el2 in dict
        dict[el2] = 'ab' if check else 'b'

    items = [key for key, val in dict.items() if val == 'ab']

    for dupe in items:
        del dict[dupe]

    return dict.keys()

print(xor_diff([1,2,3], [1,5,'a']))
