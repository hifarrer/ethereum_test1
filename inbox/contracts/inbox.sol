pragma solidity ^0.4.17;

contract Inbox {
    
    string public message;
    //this variable can be accessed without a getMessage function.
    
    //constructor function (Same name as contract) will be executed first, 1 time
    function Inbox(string initialMessage) public {
        message = initialMessage;
    }


    //public: anyone can access   private: only this contract can access function
    //You cannot return values from functions that alter data
    function setMessage(string newMessage) public {
        message = newMessage;
    }
    
    //view: data does not modify contracts data
    //returns: can only be used in view functions
    function getMessage() public view returns (string) {
        return message;
    }
    //this function is not really needed, because we can access the message variable natively
    
    //pure: will not modify or even read data
    //payable: needs to send ether to run function
}