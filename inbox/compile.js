const path = require('path');
const fs = require('fs');
const solc = require('solc');


const inboxPath = path.resolve(__dirname, 'contracts', 'Inbox.sol'); //contracts folder and inbox file
const source = fs.readFileSync(inboxPath,'utf8');

//console.log(solc.compile(source,1));//1 is the number of different contracts we are trying to compile
module.exports = solc.compile(source,1).contracts[':Inbox'];
