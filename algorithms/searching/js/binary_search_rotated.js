'use strict';
'esversion: 6';

const bsearch_rotated = (arr, target) => {
  // Set the starting bounds
  let min_idx = 0, max_idx = arr.length - 1;

  while (min_idx <= max_idx) {
    // Find the mid point
    let mid_idx = min_idx + Math.floor((max_idx - min_idx)/2);

    if (arr[mid_idx] == target) return mid_idx;

    // Check to see if the left side is sorted
    if (arr[min_idx] < arr[mid_idx]) {
      // If the left side is sorted...
      // Check to see whether target is between min and mid points
      // If it is, reduce the max to narrow the search range
      if (target >= arr[min_idx] && target < arr[mid_idx]) {
        max_idx = mid_idx - 1;
      } else {
        // If the left side is sorted but the target isn't in it, set min to mid + 1
        min_idx = mid_idx + 1;
      }
    // The left side is not sorted, so go to the sorted half and immediately check if
      // the target is within the right side
    } else if (target > arr[mid_idx] && target <= arr[max_idx]) {
      // If the target is within the right side, pull up min to mid + 1
      min_idx = mid_idx + 1;
      // If the fn reaches here, the left side is unsorted and the right side doesn't
      // contain the target. Reduce the range to only run over the unsorted left.
    } else {
      max_idx = mid_idx - 1;
    }
  }

  // Return undefined if the target is within bounds but not found in the array
  return;
};

let foo = [6,7,8,1,2,3,4,5];

console.log(bsearch_rotated(foo, 4));
