pragma solidity ^0.5.4;

/**
 * @title Owned
 * @dev Basic contract to define an owner.
 */

contract Owned {

    // The owner
    address public owner;

    event OwnerChanged(address indexed _newOwner);

    /// @dev Throws if the sender is not the owner.
    modifier onlyOwner {
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() public {
        owner = msg.sender;
    }

    /// @dev Return the ownership status of an address.
    /// @param _potentialOwner Address being checked.
    function isOwner(address _potentialOwner) external view returns (bool) {
        return owner == _potentialOwner;
    }

    /// @dev Lets the owner transfer ownership of the contract to a new owner.
    /// @param _newOwner The new owner.
    function changeOwner(address _newOwner) external onlyOwner {
        require(_newOwner != address(0), "Address must not be null");
        owner = _newOwner;
        emit OwnerChanged(_newOwner);
    }
}