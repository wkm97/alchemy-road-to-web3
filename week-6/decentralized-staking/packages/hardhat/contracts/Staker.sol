// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

import "hardhat/console.sol";
import "../lib/Interest.sol";

contract Staker {
    Interest public interestCalculator;

    mapping(address => uint256) public balances;
    mapping(address => uint256) public depositTimestamps;
    

    uint256 public constant APY_RATE = 0.9 ether;
    uint256 public constant LOCK_INTERVAL = 120 seconds;
    uint256 public constant UNLOCK_INTERVAL = 120 seconds;

    uint256 public lockDeadline;
    uint256 public unlockDeadline;
    uint256 public rewardRatePerSecond;

    // Events
    event Stake(address indexed sender, uint256 amount);
    event Received(address, uint256);
    event Execute(address indexed sender, uint256 amount);

    modifier lockDeadlineReached(bool requireReached) {
        uint256 timeRemaining = lockTimeLeft();
        if (requireReached) {
            require(timeRemaining == 0, "Lock period is not reached yet");
        } else {
            require(timeRemaining > 0, "Lock period has been reached");
        }
        _;
    }

    modifier unlockDeadlineReached(bool requireReached) {
        uint256 timeRemaining = unlockPeriodLeft();
        if (requireReached) {
            require(timeRemaining == 0, "Unlock deadline is not reached yet");
        } else {
            require(timeRemaining > 0, "Unlock deadline has been reached");
        }
        _;
    }

    constructor() {
        interestCalculator = new Interest();
        lockDeadline = block.timestamp + LOCK_INTERVAL;
        unlockDeadline = block.timestamp + LOCK_INTERVAL + UNLOCK_INTERVAL;
        rewardRatePerSecond = interestCalculator.yearlyRateToRay(APY_RATE);
    }

    function stake() public payable lockDeadlineReached(false) unlockDeadlineReached(false){
        balances[msg.sender] = balances[msg.sender] + msg.value;
        depositTimestamps[msg.sender] = block.timestamp;
        emit Stake(msg.sender, msg.value);
    }

    function withdraw() public lockDeadlineReached(true) unlockDeadlineReached(false) {
        require(balances[msg.sender] > 0, "You have no balance to withdraw!");
        uint256 individualBalance = balances[msg.sender];
        uint256 interestReward = interestCalculator.accrueInterest(individualBalance, rewardRatePerSecond, block.timestamp - depositTimestamps[msg.sender]);
        uint256 indBalanceRewards = individualBalance + interestReward;
        balances[msg.sender] = 0;

        // Transfer all ETH via call! (not transfer) cc: https://solidity-by-example.org/sending-ether
        (bool sent, bytes memory data) = msg.sender.call{value: indBalanceRewards}("");
        require(sent, "RIP; withdrawal failed :( ");
    }

    function execute() public unlockDeadlineReached(true) {
        // reset locker
        lockDeadline = block.timestamp + LOCK_INTERVAL;
        unlockDeadline = block.timestamp + LOCK_INTERVAL + UNLOCK_INTERVAL;
    }

    function lockTimeLeft() public view returns (uint256) {
        if (block.timestamp >= lockDeadline) {
            return (0);
        } else {
            return (lockDeadline - block.timestamp);
        }
    }

    function unlockPeriodLeft() public view returns (uint256) {
        if (block.timestamp >= unlockDeadline) {
            return (0);
        } else {
            return (unlockDeadline - block.timestamp);
        }
    }

    function etherToWei(uint256 _etherAmount) public view returns(uint256){
        return interestCalculator.etherToWei(_etherAmount);
    }

    receive() external payable {
      emit Received(msg.sender, msg.value);
    }
}
