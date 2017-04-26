'use strict';
'esversion: 6';

// UUID generator; not mine
// source: https://gist.github.com/jcxplorer/823878
const uuid = () => {
  // Instantiate uuid, i, and random vars
  // Assign empty str to uuid var
  var uuid = "", i, random;
  // for i = 0 .. 31
  for (i = 0; i < 32; i++) {
    // Generate random ints between 0 and 16 non-inclusive
    random = Math.random() * 16 | 0;

    // NOTE: I'm not entirely certain of the significance of the dash insertion here
    if (i == 8 || i == 12 || i == 16 || i == 20) {
      uuid += "-"
    }

    // NOTE: Similarly, unsure of why this is set as such but I haven't read RFC4122 yet
    uuid += (i == 12 ? 4 : (i == 16 ? (random & 3 | 8) : random)).toString(16);
  }
  return uuid;
}

const random_shuffle = (arr) => {
  // Return the array if it contains 1 or fewer els
  if (arr.length <= 1) return arr;

  // Create an empty list and an empty array.
  // The list will be used to grab indices and the array will be used to sort uuid's
  // which can then be used to point to the indices.
  let uuid_hash = {}, uuid_array = [];

  //
  for (var i = 0; i < arr.length; i++) {
    let temp = uuid();
    // Use the uuid as the hash's key and i as the value
    uuid_hash[temp] = i;
    // Push the uuid onto the uuid_array for sorting later
    uuid_array.push(temp);
  }

  // Proper uuid's are sufficiently random to use for shuffling
  uuid_array = uuid_array.sort();

  let result = [];

  for (var i = 0; i < arr.length; i++) {
    // The hash's key will be the uuid from the sorted uuid_array
    let hash_key = uuid_array[i];
    // Using the key above, grab the corresponding index from the hash
    let new_idx = uuid_hash[hash_key];
    // Set the result array's el at i to be the original's el at the new index
    result[i] = arr[new_idx];
  }

  // Return the results
  return arr = result;
};

console.log(random_shuffle([1,2,3,4,5,6,7]));
