pragma solidity ^0.4.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/OpenSymbolRegistry.sol";

contract TestOpenSymbolRegistry {
    function testRegisterNewSymbol() {
        OpenSymbolRegistry registry = OpenSymbolRegistry(
            DeployedAddresses.OpenSymbolRegistry()
        );
        registry.register({_id: "OSM.OpenSymbol", _symbol: "OSM", _name: "OpenSymbol", _decimals: 0, _addr: 0x0, _project: "Open Symbol to the rescue", _owner: 0x00c1912fee45d61c87cc5ea59dae31190fffff232d});
    }

    /**
    function testRegisterExistingSymbol() {
    }
    */

    function testLookupSymbol() {
        OpenSymbolRegistry registry = OpenSymbolRegistry(
            DeployedAddresses.OpenSymbolRegistry()
        );
        registry.register({_id: "OSM.OpenSymbol", _symbol: "OSM", _name: "OpenSymbol", _decimals: 0, _addr: 0x0, _project: "Open Symbol to the rescue", _owner: 0x00c1912fee45d61c87cc5ea59dae31190fffff232d});
    }
}
