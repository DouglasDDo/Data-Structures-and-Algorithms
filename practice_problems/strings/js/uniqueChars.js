'use strict';
'esversion: 6';

const uniqueChars = (str) => {
  if (str.length < 1) return undefined;
  if (str.length == 1) return true;

  let charsArr = Array.from(str).sort();

  for (var i = 0; i < charsArr.length - 1; i++) {
    if (charsArr[i] == charsArr[i + 1]) return false;
  }

  return true;
};

console.log(uniqueChars('mam'));
console.log(uniqueChars('spam'));
