'use strict';
'esversion: 6';

let compAsc = (a,b) => a < b;
let compDesc = (a,b) => !compAsc(a,b);

const bubble_sort = (arr, comp = compAsc) => {
  if (arr.length <= 1) return arr;

  let unsorted = true;

  while (unsorted) {
    unsorted = false;

    for (var i = 0; i < arr.length - 1; i++) {
      if (comp(arr[i], arr[i + 1])) {
        let temp = arr[i];
        arr[i] = arr[i + 1];
        arr[i + 1] = temp;

        unsorted = true;
      }
    }
  }

  return arr;
};

let foo = [2,3,1];
console.log(bubble_sort(foo));
