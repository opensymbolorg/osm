pragma solidity ^0.4.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/OpenSymbolToken.sol";

contract TestOpenSymbolToken {
    uint public initialBalance = 1 ether;

    function testIssuedTokensOnDeploy() {
    }

    function testPurchase() {
        OpenSymbolToken token = OpenSymbolToken(
            DeployedAddresses.OpenSymbolToken()
        );

        token.purchase();
    }
}
