pragma solidity ^0.4.17;

contract Lottery {
    address public manager;
    address[] public players;  //dynamic array that can only contain addresses

    function Lottery() public{
        manager = msg.sender; //global variable msg
    }
    function enter() public payable {
        //require(msg.value > 10000000000000000 //convert .01 eth to wei on https://etherconverter.online/)
        require(msg.value > .01 ether); //this way it will be considered into ether
        players.push(msg.sender);
    }

    //this is pseudo random because there is no way to have a random function
    function random() private view returns (uint){  //change to public in order to debug
       return uint(keccak256(block.difficulty, now, players));//keccack is the same as sha3

    }

    function pickWinner() public restricted{ //using modifier below
        require(msg.sender == manager); //make sure only manager can run this function

        uint index = random() % players.length;
        players[index].transfer(this.balance); //balance has all the money in the smart contract
        players = new address[](0); // 0 is the initial size, we are re-setting the array to start again

    }

    modifier restricted() { //this helps us save lines of code
        require(msg.sender == manager);
        _; //this is were the code would execute within the function
    }

    function getPlayers() public view returns (address[]){
        return players;
    }
}
