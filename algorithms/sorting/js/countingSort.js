'use strict';
'esversion: 6';

let compAsc = (a,b) => a < b;
let compDesc = (a,b) => !compAsc(a,b);

const countingSort = (arr, comp = compAsc) => {
  if (arr.length <= 1) return arr;

  let maxNum = Math.max(...arr);
  let minNum = Math.min(...arr);

  let countArr = new Array(maxNum - minNum + 1).fill(0);

  arr.forEach((el) => {
    countArr[el - minNum] += 1;
  });

  let currentIdx = comp(1,2) ? 0 : arr.length;

  for (var i = minNum; i <= maxNum; i++) {
    let singleCount = countArr[i - minNum];

    if (singleCount == undefined) continue;

    let insertArr = new Array(singleCount).fill(i)

    if (comp(1,2)) {
      arr.splice(currentIdx, singleCount, ...insertArr);
      currentIdx += singleCount;
    } else {
      arr.splice(currentIdx - singleCount, singleCount, ...insertArr);
      currentIdx -= singleCount;
    }
  }

  return arr;
};

let foo = [-1,4,5,3,3,1,5];
console.log(countingSort(foo));
