// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.17;

/**
    * @title A lottery contract for maze metaverse pass purchasers
    * @author Amy (Planning) and Ryoko (Coding) with reference to an online coding video
    * @notice This contract is for a hackthon project submission purpose only. 
    * @dev VRF will be reworked for production use.
    */ 

import "https://github.com/optimazme/Solidity-Contracts/blob/main/contracts/VRF.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

    error Pass_NotPurchased();
    error NftTransfer_Failed();

// This is the lottery contract which allows the puchaser of a maze pass to automatically enter into
contract nftLotteryForTheMazePassPurchaser is ownable { 

    // Check whether a pass has been purchased
    bool private _passHasBeenPurchased;

    /* State Variables */
    address payable[] private lotteryPlayers;

    /*Events*/
    event LotteryEntered(address indexed player);
    event LotteryWon(address lotterywinner);
    event LotteryNotWon(address nonwinner);

    modifier onlyOwner {
        require(msg.sender == owner); 
        _;
    }

    constructor(address initialOwnersAddress) {
        owner = initialOwnersAddress;
    }

    /** 
        * @notice We are checking whether a user has purchased a pass to join the lottery
        * @param I need to rethink whether boolean is the best way to handle this function
    */
    function enterLottery(bool passHasBeenPurchased) public payable {

        /** Here, the intent is to say Yes or No regarding whether a user has purchased a pass
        using boolean but I am learning as I code and need more time to be able to make it work.
        */
        if  passHasBeenPurchased != "Yes";
        {
            revert User_HasNotPurchasedThePass();
        }
        lotteryPlayers.push(payable(msg.sender));
        emit LotteryEntered(msg.sender);
    }

    /**
    * @notice This function checks if a rn is below 1.  If so, the user wins the lottery.
    * @param The parameter is hard coded for a hackathon submission purpose.
    * @dev VRF and the lottery logic will be reworked for production deployment.
    * @notice Intended to be set so that only owner can call the function to ensure security of the contract
    */ 
    function pickLotteryWinner(address passPurchaser) external onlyOwner {
        importSeedFromThird(5);
        return randomNumber; 
        }
            if (randomNumber < 1) {
                return Winner
                emit LotteryWon(lotterywinner);
            }
                // Here, the intent is to emit the outcome of a lottery for every user
                emit LotteryNotWon(nonwinner);  
        } 

    }
}