'use strict';
'esversion: 6';

const caesarCypherAscii = (phrase, shiftNum) => {
  let minUpper = ("A").charCodeAt(0), maxUpper = ("Z").charCodeAt(0),
      minLower = ("a").charCodeAt(0), maxLower = ("z").charCodeAt(0);

  let letters = Array.from(phrase);

  let _isUpper = (num) => num >= minUpper && num <= maxUpper;
  let _isLower = (num) => num >= minLower && num <= maxLower;

  let result = letters.map((letter) => {
    let converted = letter.charCodeAt(0);
    if (_isUpper(converted)) {
      return converted + shiftNum > maxUpper ?
                (converted + shiftNum) % maxUpper + minUpper - 1 : converted + shiftNum
    } else if (_isLower(converted)) {
      return converted + shiftNum > maxLower ?
                (converted + shiftNum) % maxLower + minLower - 1 : converted + shiftNum
    } else {
      return converted
    }
  });

  return result.map((ascii) => String.fromCharCode(ascii)).join('');
};

const arrayFromAscii = (startChar, length) => {
  let result = [];

  for (var i = 0; i < length; i++) {
    result.push(String.fromCharCode(startChar.charCodeAt(0) + i));
  }

  return result;
};

const caesarCypher = (phrase, shiftNum) => {
  let letters = Array.from(phrase);
  let uppers = arrayFromAscii("A", 26), lowers = arrayFromAscii("a", 26);
  let result = [], newIdx = 0;

  letters.forEach((letter) => {
    newIdx = (lowers.indexOf(letter) + shiftNum) % 26;

    if (lowers.includes(letter)) {
      result.push(lowers[newIdx]);
    } else if (uppers.includes(letter)) {
      result.push(uppers[newIdx]);
    } else {
      result.push(letter);
    }
  });

  return result.join('');
};


console.log(caesarCypherAscii('hellozZ', 1));
console.log(caesarCypher('hellozZ', 1));
