pragma solidity ^0.4.16;

contract OpenSymbolRegistry {
    address public owner;
    
    function OpenSymbolRegistry () public {
        owner = msg.sender;
    }
    
    struct Asset {
        // string name;
        string symbol;
        // uint decimal;
        // address projectAddress;
        // address ownerAddress;
        // string projectName;
        // string image;
        // string website;
        // string blockchain;
    }
    Asset[] public assets;
    
    function registerAsset(
        string name
    ) public returns (string) {
        Asset memory newAsset = Asset("OSM");
        assets.push(newAsset);
        return name;
    }
}
