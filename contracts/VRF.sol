// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.5.8;

/**
    * @title A mock verificable random function
    * @author Optimaze team copied from https://medium.com/gammastack/random-number-generation-on-blockchain-d3141e1efc2
    * @notice This vrf is for a testnet and hackthon submission purpose only. Don't use this in production.
    */ 

contract Test {
    /**
        * @notice Generates a random number between 0 - 100
        * @param seed The seed to generate different number if block.timestamp is same
        * for two or more numbers.
        */
    function importSeedFromThird(uint256 seed) public view returns (uint8) {
        bytes32 bHash = blockhash(block.number - 1);
        uint8 randomNumber = uint8(
            uint256(keccak256(abi.encodePacked(block.timestamp, bHash, seed))) % 100
        );
        return randomNumber;
    }

    /**
     * @notice Generates a random number between 0 - 100
     * @param seed The seed to generate different number if block.timestamp is same
     * for two or more numbers.
     * @param salt The salt to randomize the pattern
     */
    function importSeedFromThirdSalt(uint256 seed, uint256 salt)
        public
        view
        returns (uint8)
    {
        bytes32 bHash = blockhash(block.number - 1);
        uint8 randomNumber = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, bHash, seed, salt))) % 100);
        return randomNumber;
    }

    /**
     * @notice Generates a random number between 0 - 100
     * @param seed The seed to generate different number if block.timestamp is same
     * for two or more numbers.
     * @param salt The salt to randomize the pattern
     * @param sugar The sugar same as salt but for more randomization
     */
    function importSeedFromThirdSaltSugar(
        uint256 seed,
        uint256 salt,
        uint256 sugar
    ) public view returns (uint8) {
        bytes32 bHash = blockhash(block.number - 1);
        uint8 randomNumber = uint8(uint256(keccak256(abi.encodePacked(block.timestamp, bHash, seed, salt, sugar))) % 100);
        return randomNumber;
    }
}