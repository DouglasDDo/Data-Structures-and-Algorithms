// This will do the same thing as arr[x ... y] = [a ... b]; make sure the ranges are
// the same size or the replacement will only be partially integrated
Array.prototype.splice
  .apply(arr, [arr_start_idx, replacement_length]
      .concat(replacement));
