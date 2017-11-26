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

    function OpenSymbolRegistry() {
        owner = msg.sender;
    }

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
            symbol.symbol = _symbol;
            symbol.exist = true;
            symbolsIndex.push(_symbol);
        }

        Asset storage asset = assets[_id];
        if (! asset.exist) {
            symbol.entries.push(_id);

            asset.id = _id;
            asset.symbol = _symbol;
            asset.name = _name;
            asset.decimals = _decimals;
            asset.addr = _addr;
            asset.project = _project;
            asset.owner = _owner;
            asset.exist = true;
            assetsIndex.push(_symbol);
        }
    }

    function lookup(bytes8 _symbol) view returns (bytes32 id, uint8 decimals, address addr, bytes32 status) {
        Symbol storage symbol = symbols[_symbol];

        if (symbol.exist) {
            if (uint(symbol.registered) == 0) {
                status = "listed";

                // get asset with highest votes
                uint highestVotes = 0;
                for (uint i = 0; i < symbol.entries.length; ++i) {
                    Asset storage asset = assets[
                        symbol.entries[i]
                    ];

                    if (i == 0 || highestVotes < asset.votes) {
                        highestVotes = asset.votes;
                        id = asset.id;
                        decimals = asset.decimals;
                        addr = asset.addr;
                    }
                }
            } else {
                status = "registered";
                id = symbol.registered;

                asset = assets[id];
                decimals = asset.decimals;
                addr = asset.addr;
            }
        } else {
            status = "available";
        }
    }
}
