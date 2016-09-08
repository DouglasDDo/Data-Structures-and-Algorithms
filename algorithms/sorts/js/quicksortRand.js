'use strict';
'esversion: 6';

// Will sort an array from least to greatest, left to right
const quicksortRand_1 = (arr) => {
  if (arr.length < 2) return arr;

  let pivot = Math.floor(Math.random() * arr.length),
      left  = [],
      right = [];

  for (let i = 0; i < arr.length; i++) {
    if (i === pivot) continue;
    let n = arr[i];
    (n < arr[pivot]) ? left.push(n) : right.push(n)
  }

  return quicksortRand_1(left).concat([arr[pivot]], quicksortRand_1(right));
};

// Will sort an array according to comparator passed in, else least to greatest, left to right
const quicksortRand_2 = (arr, comparator) => {
  if (arr.length < 2) return arr;

  if (typeof comparator !== 'function') {
    
  }
};
