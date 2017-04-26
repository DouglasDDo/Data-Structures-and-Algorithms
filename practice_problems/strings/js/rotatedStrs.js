'use strict';
'esversion: 6';

const rotatedStrs = (str1, str2) => {
  if (str1.length !== str2.length) return false;

  let fullRange = str1 + str1;

  return fullRange.toLowerCase().includes(str2.toLowerCase());
};

console.log(rotatedStrs('cool', 'loco'));
console.log(rotatedStrs('path', 'thpa'));
