pragma solidity ^0.4.0;

contract OpenSymbolRegistry {
    struct Asset {
        // symbol info
        bytes32 id;
        bytes8 symbol;
        bytes32 name;
        uint8 decimals;
        address addr; // smart contract address

        // project info
        bytes32 project;
        address owner;

        // voting info
        uint votes;

        // meta info
        //string[] data_key;
        //string[] data_value;

        // hack: support checking a key exists in mapping
        bool exist;
    }

    struct Symbol {
        // symbol info
        bytes8 symbol;
        bytes32 registered;

        // vote info
        uint started_at;
        uint ended_at;

        // list of ids
        bytes32[] entries;

        // hack: support checking a key exists in mapping
        bool exist;
    }

    address owner;

    // assets
    mapping(bytes32 => Asset) assets;
    bytes32[] assetsIndex;

    // symbols
    mapping(bytes8 => Symbol) symbols;
    bytes8[] symbolsIndex;

    function register(
        bytes32  _id,
        bytes8   _symbol,
        bytes32  _name,
        uint8    _decimals,
        address  _addr,
        bytes32  _project,
        address  _owner
    ) {
        Symbol storage symbol = symbols[_symbol];
        if (! symbol.exist) {
            symbols[_symbol].symbol = _symbol;
            symbols[_symbol].exist = true;
            symbolsIndex.push(_symbol);
        }

        Asset storage asset = assets[_symbol];
        if (! asset.exist) {
            assets[_symbol].id = _id;
            assets[_symbol].symbol = _symbol;
            assets[_symbol].name = _name;
            assets[_symbol].decimals = _decimals;
            assets[_symbol].addr = _addr;
            assets[_symbol].project = _project;
            assets[_symbol].owner = _owner;
            assets[_symbol].exist = true;
            assetsIndex.push(_symbol);
        }
    }

    function lookup(bytes8 _symbol) view returns (bytes32 id, uint8 decimals, address addr, bytes32 status) {
        Symbol storage symbol = symbols[_symbol];

        /** TODO pick first project
        id = ;
        decimals = ;
        addr = ;
        status ;
        */
    }
}
