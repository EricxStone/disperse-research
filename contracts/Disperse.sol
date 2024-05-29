pragma solidity ^0.4.25;


import 'openzeppelin-solidity/contracts/token/ERC20/SafeERC20.sol';

contract Disperse {
    using SafeERC20 for IERC20;

    function disperseEther(address[] recipients, uint256[] values) external payable {
        for (uint256 i = 0; i < recipients.length; i++)
            recipients[i].transfer(values[i]);
        uint256 balance = address(this).balance;
        if (balance > 0)
            msg.sender.transfer(balance);
    }

    function disperseToken(IERC20 token, address[] recipients, uint256[] values) external {
        uint256 total = 0;
        for (uint256 i = 0; i < recipients.length; i++)
            total += values[i];
        token.safeTransferFrom(msg.sender, address(this), total);
        for (i = 0; i < recipients.length; i++)
            token.safeTransfer(recipients[i], values[i]);
    }

    function disperseTokenSimple(IERC20 token, address[] recipients, uint256[] values) external {
        for (uint256 i = 0; i < recipients.length; i++)
            token.safeTransferFrom(msg.sender, recipients[i], values[i]);
    }
}
