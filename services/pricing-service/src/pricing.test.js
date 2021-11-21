import assert from 'assert';

import priceSomething from './pricing.js';

describe('Pricing#priceSomething', function () {
  it('should multiply price by quantity', function () {
    assert.equal(priceSomething(5, 2), 10);
  });
});
