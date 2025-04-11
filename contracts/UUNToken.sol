// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/security/Pausable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract UUNToken is ERC20, Ownable, Pausable, ERC20Burnable {
    uint256 private constant _initialSupply = 700_000_000 * 10 ** 18; // 7억 개
    address private constant CREATOR = 0x1dAa57F6D7590B493C45c7A6f5ab558546554016;

    constructor() ERC20("UUN Token", "UUN") {
        _mint(CREATOR, _initialSupply * 80 / 100); // 창립자에게 80%
        _mint(address(this), _initialSupply * 20 / 100); // 커뮤니티 풀 20%
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function transfer(address to, uint256 amount) public override whenNotPaused returns (bool) {
        return super.transfer(to, amount);
    }

    function transferFrom(address from, address to, uint256 amount) public override whenNotPaused returns (bool) {
        return super.transferFrom(from, to, amount);
    }
}
