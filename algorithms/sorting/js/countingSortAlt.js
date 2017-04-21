'use strict';
'esversion: 6';

let compAsc = (a,b) => a < b;
let compDesc = (a,b) => !compAsc(a,b);

// This version doesn't alter the original array
const countingSort = (arr, comp = compAsc) => {
  let result = [];

  if (arr.length <= 1) {
    result = arr;
    return result;
  }

  let maxNum = Math.max(...arr);
  let minNum = Math.min(...arr);

  let countArr = new Array(maxNum - minNum + 1).fill(0);

  arr.forEach((el) => {
    countArr[el - minNum] += 1;
  });

  let idx = -1;

  countArr.forEach((el) => {
    idx++;

    let insertArr = new Array(el);

    if (comp(1,2)) {
      insertArr.fill(minNum + idx);
      result = result.concat(insertArr);
    } else {
      insertArr.fill(minNum + idx);
      result = insertArr.concat(result);
    }
  });

  return result;
};

let foo = [-1,4,5,3,3,1,5];
console.log(countingSort(foo));
