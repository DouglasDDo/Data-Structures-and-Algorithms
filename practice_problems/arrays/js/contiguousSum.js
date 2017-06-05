'use strict';
'esversion: 6';

const conSum = (arrNums) => {
  if (arrNums.length < 1) return 0;
  if (arrNums.length == 1) return arrNums[0];

  let currentSum = 0;
  let maxSum = arrNums[0];

  arrNums.forEach( (current) => {
    currentSum = currentSum + current >= current ? currentSum + current : current;
    maxSum = maxSum >= currentSum ? maxSum : currentSum;
  });

  return maxSum;
};
let foo = [4, -2, 3, -10, 1, 2, 3];

console.log(conSum(foo));
