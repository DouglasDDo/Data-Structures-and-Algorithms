'use strict';
'esversion: 6';

const binary_search = (arr, target) => {
  // The array is sorted so check if the target is within bounds
  // by checking it against the first and last elements
  if (target < arr[0] || target > arr[arr.length - 1]) return;

  // Assign the first and last indices to vars
  let min_idx = 0, max_idx = arr.length - 1;

  // Run a loop in which:
  // A middle index is assigned
  // If the el at mid_idx is target, return mid_idx
  // Otherwise, either lower max_idx to mid_idx - 1
  // or raise min_idx to mid_idx + 1, depending on whether
  // the target is lower or higher than the el at mid_idx
  while (min_idx <= max_idx) {
    let mid_idx = min_idx + (max_idx - min_idx)/2

    if (arr[mid_idx] == target) return mid_idx;

    if (target < arr[mid_idx]) {
      max_idx = mid_idx - 1;
    } else {
      min_idx = mid_idx + 1;
    }
  }

  // If the target is within bounds but is not in the array, return undefined
  return;
};

// Time Complexity: O(log2(N)) where N is the size of the array
