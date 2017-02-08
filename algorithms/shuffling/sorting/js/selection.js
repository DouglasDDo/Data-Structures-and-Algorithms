'use strict';
'esversion: 6';

const selection_sort = (arr) => {
  // Loop through the array, keep track of pointer, stop at second to last
  for (var i = 0; i < arr.length - 1; i++) {
    // hold the index of the current smallest value
    let idx = i;

    // Loop through the subarray beyond the pointer
    for(var j = i + 1; j < arr.length; j++){
      // if the val at the current idx is less than the current element at j,
      // leave idx alone; otherwise, have idx point to the current element
      idx = arr[idx] < arr[j] ? idx : j;
    }

    // use a temporary hold for one of the elements being swapped
    let hold = arr[i];
    // assign a new value, using index of current smallest value
    arr[i] = arr[idx];
    // assign idx location to the held element
    arr[idx] = hold;
    // loop back or end
  }

  // return the sorted array
  return arr;
};

console.log(selection_sort([2,4,6,1,3,5]));
