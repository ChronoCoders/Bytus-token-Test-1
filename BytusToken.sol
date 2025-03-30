// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @dev Interface for the receiveApproval function
 */
interface TokenRecipient {
    function receiveApproval(
        address _from, 
        uint256 _value, 
        address _token, 
        bytes calldata _extraData
    ) external;
}

/**
 * @title BytusToken
 * @dev Implementation of the Bytus Token with OpenZeppelin contracts
 */
contract BytusToken is ERC20, ERC20Burnable, Pausable, Ownable {
    uint8 private immutable _decimals;

    /**
     * @dev Constructor that initializes the token with name, symbol, and initial supply
     */
    constructor(
        uint256 initialSupply,
        string memory name_,
        string memory symbol_
    ) ERC20(name_, symbol_) Ownable() {
        _decimals = 3; // Bytus uses 3 decimals as per original contract
        
        // Mint initial supply to the contract creator
        _mint(msg.sender, initialSupply * 10 ** decimals());
    }

    /**
     * @dev Returns the number of decimals used for token
     */
    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }

    /**
     * @dev Pauses all token transfers
     */
    function pause() public onlyOwner {
        _pause();
    }

    /**
     * @dev Unpauses all token transfers
     */
    function unpause() public onlyOwner {
        _unpause();
    }

    /**
     * @dev Override to add the whenNotPaused modifier
     */
    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal virtual override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
    }

    /**
     * @dev Sets the allowance for a spender and then calls the receiving contract
     */
    function approveAndCall(
        address spender,
        uint256 value,
        bytes calldata extraData
    ) public whenNotPaused returns (bool success) {
        if (approve(spender, value)) {
            TokenRecipient(spender).receiveApproval(
                msg.sender,
                value,
                address(this),
                extraData
            );
            return true;
        }
        return false;
    }
}