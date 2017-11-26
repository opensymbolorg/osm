pragma solidity ^0.4.0;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/OpenSymbolRegistry.sol";

contract TestOpenSymbolRegistry {
    function testRegisterNewSymbol() {
        OpenSymbolRegistry registry = OpenSymbolRegistry(
            DeployedAddresses.OpenSymbolRegistry()
        );
        registry.register("OSM.OpenSymbol", "OSM", "OpenSymbol", 0, 0x0, "Open Symbol to the rescue", 0x00c1912fee45d61c87cc5ea59dae31190fffff232d);
    }

    //function testRegisterExistingSymbol() {
    //}

    function testLookupSymbol() {
        OpenSymbolRegistry registry = OpenSymbolRegistry(
            DeployedAddresses.OpenSymbolRegistry()
        );
        registry.register("OSM.OpenSymbol", "OSM", "OpenSymbol", 0, 0x0, "Open Symbol to the rescue", 0x00c1912fee45d61c87cc5ea59dae31190fffff232d);

        var (id, decimals, addr, status) = registry.lookup("OSM");

        Assert.equal(status, "listed", "Symbol status is returned");
        Assert.equal(id, "OSM.OpenSymbol", "Symbol id is returned");
        Assert.equal(addr, 0x0, "Symbol smart contract address is returned");
        Assert.equal(uint(decimals), uint(0), "Symbol decimals is returned");
    }
}
