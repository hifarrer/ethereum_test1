const assert = require('assert');
const ganache = require('ganache-cli');
const Web3 = require('web3');
const web3 = new Web3(ganache.provide());

//test

class Car{
  park(){
    return 'stopped';
  }

  drive(){
    return 'vroom';
  }
}

describe('Car class', () => {//(any string,)
  it('can park', ()=>{
    const car = new Car();
    assert.equal(car.park(),'stopped');
  });
});
