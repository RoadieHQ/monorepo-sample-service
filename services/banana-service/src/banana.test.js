import assert from 'assert';

import getBanana from './bananas.js';

describe('Bananas#getBanana', function () {
  it('get a banana', function () {
    assert.equal(getBanana(), 'banana');
  });
});
