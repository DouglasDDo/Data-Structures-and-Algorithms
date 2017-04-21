'use strict';
'esversion: 6';

// Will sort an array from least to greatest, left to right
const quicksortRand = (arr) => {
  if (arr.length < 2) return arr;

  let pivot = Math.floor(Math.random() * arr.length),
      left  = [],
      right = [];

  for (let i = 0; i < arr.length; i++) {
    if (i === pivot) continue;
    let n = arr[i];
    (n < arr[pivot]) ? left.push(n) : right.push(n)
  }

  return quicksortRand(left).concat([arr[pivot]], quicksortRand(right));
};

// comparators
const compAsc = (a,b) => a < b;
const compDesc = (a,b) => !compAsc(a,b);

// Will sort an array according to comparator passed in, else least to greatest, left to right
const quicksortRandComp = (arr, comp = compAsc) => {
  if (arr.length < 2) return arr;

  let pivot = Math.floor(Math.random() * arr.length),
      left  = [],
      right = [];

  for (var i = 0; i < arr.length; i++) {
    if (i === pivot) continue;
    let n = arr[i];
    comp(n, arr[pivot]) ? left.push(n) : right.push(n)
  }

  return quicksortRandComp(left, comp).concat([arr[pivot]], quicksortRandComp(right, comp));
};

let foo = [1,4,6,2,34,6,7,2,31, 28];
console.log(quicksortRandComp(foo, compDesc));
