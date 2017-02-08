'use strict';

Function.prototype.inheritsFrom = (parent) => {
  class Surrogate() {}
  Surrogate.prototype = parent.prototype;
  child.prototype = new Surrogate();
  child.prototype.constructor = child;
};
