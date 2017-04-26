'use strict';
'esversion: 6';

const bsearch_rec = (arr, target, left = 0, right = undefined) => {
  // To recursively run this function, end point indices are needed.
  // But when the fn first runs, it's difficult to determine the right index so
  // this step is necessary.
  if (right == undefined) {
    right = arr.length - 1;
  }

  // Ensure target is within bounds and return undefined otherwise
  if (target < arr[0] || target > arr[arr.length - 1]) return;

  // Define a mid point to check mid el against target.
  // Don't forget Math.floor() or .ceil() otherwise floats will be used.
  let mid_idx = left + Math.floor((right - left)/2);

  // Return the mid index if the target is there
  if (arr[mid_idx] == target) return mid_idx;

  // Otherwise, set either left/right as mid_idx +/- 1 and call the fn recursively
  if (target < arr[mid_idx]) {
    return bsearch_rec(arr, target, left, mid_idx - 1);
  } else {
    return bsearch_rec(arr, target, mid_idx + 1, right);
  }

  // Return undefined if the target is within bounds but not in the array
  return;
};

console.log(bsearch_rec([1,2,3,4,5,6,7], 7));
