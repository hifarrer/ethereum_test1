const path = require('path');
const fs = require('fs');
const solc = require('solc'); //solidity compiler


const LotteryPath = path.resolve(__dirname, 'contracts', 'Lottery.sol'); //contracts folder and inbox file
const source = fs.readFileSync(LotteryPath,'utf8');

//console.log(solc.compile(source,1));//1 is the number of different contracts we are trying to compile
module.exports = solc.compile(source,1).contracts[':Lottery'];
//:Inbox , the semicolon is incase we need to specify a file like myinbox:Inbox
