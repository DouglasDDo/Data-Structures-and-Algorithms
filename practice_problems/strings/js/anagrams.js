'use strict';
'esversion: 6';

const areAnagrams = (str1, str2) => {
  if (str1.length !== str2.length) return false;

  let chars1 = Array.from(str1).sort();
  let chars2 = Array.from(str2).sort();

  for (var i = 0; i < chars1.length; i++) {
    if (chars1[i] !== chars2[i]) return false;
  }

  return true;
};

// Could also create hashes and count letters
const areAnagramsHashed = (str1, str2) => {
  if (str1.length !== str2.length) return false;

  let chars1 = Array.from(str1.toLowerCase()), chars2 = Array.from(str2.toLowerCase());

  let hash1 = {}, hash2 = {};

  for (var i = 0; i < str1.length; i++) {
    hash1[chars1[i]] = hash1[chars1[i]] ? hash1[chars1[i]] += 1 : 1;
    hash2[chars2[i]] = hash2[chars2[i]] ? hash2[chars2[i]] += 1 : 1;
  }

  for (var i = 0; i < str1.length; i++) {
    if (hash1[chars1[i]] !== hash2[chars1[i]]) return false;
  }

  return true;
};

console.log(areAnagrams("hello", "world")); // => false
console.log(areAnagrams("hoses", "shoes"));
console.log(areAnagramsHashed("hello", "world")); // => false
console.log(areAnagramsHashed("hoses", "shoes"));
