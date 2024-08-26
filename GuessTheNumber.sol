// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GuessTheNumber {
    address public owner;
    uint private winningNumber;
    uint public prizePool;

    event Hint(string message);
    event CongratulatoryMessage(address winner, uint prize);

    constructor(uint _winningNumber) {
        require(_winningNumber >= 1 && _winningNumber <= 100, "Winning number must be between 1 and 100");
        owner = msg.sender;
        winningNumber = _winningNumber;
        assert(winningNumber >= 1 && winningNumber <= 100);
    }

    function depositPrize() public payable onlyOwner {
        require(msg.value > 0, "Prize amount must be greater than zero");
        uint oldPrizePool = prizePool;
        prizePool += msg.value;
        assert(prizePool > oldPrizePool);
    }

    function guess(uint _number) public {
        require(_number >= 1 && _number <= 100, "Guess must be between 1 and 100");
        require(prizePool > 0, "No prize available");

        if (_number == winningNumber) {
            uint prize = prizePool;
            prizePool = 0;
            payable(msg.sender).transfer(prize);
            emit CongratulatoryMessage(msg.sender, prize);
            assert(prizePool == 0);
        } else if (_number < winningNumber) {
            emit Hint("Try a higher number");
        } else {
            emit Hint("Try a lower number");
        }
    }

    function resetGame(uint _newWinningNumber) public onlyOwner {
        require(_newWinningNumber >= 1 && _newWinningNumber <= 100, "New winning number must be between 1 and 100");
        winningNumber = _newWinningNumber;
        assert(winningNumber >= 1 && winningNumber <= 100);
    }

    modifier onlyOwner() {
        if (msg.sender != owner) {
            revert("Only the owner can call this function");
        }
        _;
    }
}