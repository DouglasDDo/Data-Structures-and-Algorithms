'use strict';
'esversion: 6';

const fy_shuffle = (arr) => {
  // Grab the starting max and assign it
  let n = arr.length - 1;

  // The idea here is to grab a random number between 0 and a decreasing max
  while (n !== 0) {
    // Grab the random number; the pipe and 0 set the floor and forces integer results
    let i = Math.random() * (n + 1) | 0;

    // Swap the last el with the el at the random index
    let temp = arr[i];
    arr[i] = arr[n];
    arr[n] = temp;

    // Decrease the max for the next round
    n--;
  }

  return arr;
};

var foo = [1,2,3,4,5,6,7];
console.log(fy_shuffle(foo));
