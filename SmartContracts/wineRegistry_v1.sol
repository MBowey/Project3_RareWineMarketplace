pragma solidity ^0.5.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/token/ERC721/ERC721Full.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/release-v2.5.0/contracts/drafts/Counters.sol";

contract WineRegistry is ERC721Full {

    constructor() ERC721Full("CorkToken", "CORK") public { }

    using Counters for Counters.Counter;
    Counters.Counter token_ids;

    struct Wine {
        string bottle_id;               //
        string name;
        string variety;                 // type of wine/grape (cab sauv, pinot, etc.)
        uint vintage;                   // year
        string region; 
        string producer;
        // string classification;       // each country has its own classification (Italy - DOCG, France - AOC, etc. )
        string ownership; 
        uint appraisal_value;
        string bottle_status;            // open or un-open (maybe this should be a bool (True or False??)
        string bottle_location;
        // string bottle_condition;      // bottle damage, cork issues, etc. 
        // string status_date;           // last date bottle was inspected
    }

    mapping(uint => Wine) public wine_collection;

    event Appraisal(uint token_id, uint appraisal_value, string report_uri);
    
    event Status(uint token_id, string bottle_status, string report_uri);
    
    event Location(uint token_id, string bottle_location, string report_uri);

    function registerWine(
        address owner, 
        string memory bottle_id,
        string memory name, 
        string memory variety, 
        uint vintage,
        string memory region,
        string memory producer,
        // string memory classification,
        string memory ownership, 
        uint initial_value,
        string memory initial_status,
        string memory initial_location,
        // string memory bottle_condition,
        // string memory status_date,
        string memory token_uri) 
        public returns(uint) {
        
            token_ids.increment();
            uint token_id = token_ids.current();

            _mint(owner, token_id);
            _setTokenURI(token_id, token_uri);

            wine_collection[token_id] = Wine(
                bottle_id, 
                name, 
                variety,
                vintage,
                region,
                producer,
                // classification,
                ownership,
                initial_value,
                initial_status,
                initial_location
                // bottle_condition
                // initial_date
                );

            return token_id;
    }

    function newAppraisal(uint token_id, uint new_value, string memory report_uri) public returns(uint) {
        wine_collection[token_id].appraisal_value = new_value;

        emit Appraisal(token_id, new_value, report_uri);

        return  wine_collection[token_id].appraisal_value;
    }
    
    function bottleStatus(uint token_id, string memory new_status, string memory report_uri) public returns(string memory) {
        wine_collection[token_id].bottle_status = new_status;

        emit Status(token_id, new_status, report_uri);

        return wine_collection[token_id].bottle_status;
    }
    
    function bottleLocation(uint token_id, string memory new_location, string memory report_uri) public returns(string memory) {
        wine_collection[token_id].bottle_location = new_location;

        emit Location(token_id, new_location, report_uri);

        return  wine_collection[token_id].bottle_location;
    }
}