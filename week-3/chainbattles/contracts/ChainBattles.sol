// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Demo Contract Address on Mumbai: 0x702F82Ad837793329ed27dA20836AaAa7D459A0f
// Exercise Contract Address on Mumbai: 0xe012f7252C33B39f2aE86528366aa893023ecbe7

import "hardhat/console.sol";

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/utils/Base64.sol";
import "@openzeppelin/contracts/utils/math/SafeMath.sol";

contract ChainBattles is ERC721URIStorage {
    using Strings for uint256;
    using SafeMath for uint256;
    using Counters for Counters.Counter;
    uint256 randNonce = 0;
    Counters.Counter private _tokenIds;

    mapping(uint256 => Character) public tokenIdToCharacter;
    uint256 private CLASS_SIZE = 5;
    string[] public classes = ["Warrior", "Mage", "Summoner", "Rogue", "Archer"];

    struct Character {
        string name;
        string class;
        uint256 level;
        uint256 agility;
        uint256 strength;
        uint256 intelligence;
    }

    constructor() ERC721("Chain Battles", "CBTLS") {}

    function randMod(uint256 _modulus) internal returns (uint256) {
        randNonce++;
        return
            uint256(
                keccak256(
                    abi.encodePacked(block.timestamp, msg.sender, randNonce)
                )
            ) % _modulus;
    }

    function generateCharacter(uint256 tokenId)
        public
        view
        returns (string memory)
    {
        string memory name;
        string memory class;
        uint256 level;
        uint256 agility;
        uint256 strength;
        uint256 intelligence;
        (name, class, level, agility, strength, intelligence) = getAttributes(tokenId);
        bytes memory svg = abi.encodePacked(
            '<svg xmlns="http://www.w3.org/2000/svg" preserveAspectRatio="xMinYMin meet" viewBox="0 0 350 350">',
            "<style>.base { fill: white; font-family: serif; font-size: 14px; }</style>",
            '<rect width="100%" height="100%" fill="black" />',
            '<text x="50%" y="20%" class="base" dominant-baseline="middle" text-anchor="middle">',
            class,
            "</text>",
            '<text x="50%" y="30%" class="base" dominant-baseline="middle" text-anchor="middle">',
            "Name: ",
            name,
            "</text>",
            '<text x="50%" y="40%" class="base" dominant-baseline="middle" text-anchor="middle">',
            "Level: ",
            level.toString(),
            "</text>",
            '<text x="50%" y="50%" class="base" dominant-baseline="middle" text-anchor="middle">',
            "Agility: ",
            agility.toString(),
            "</text>",
            '<text x="50%" y="60%" class="base" dominant-baseline="middle" text-anchor="middle">',
            "Strength: ",
            strength.toString(),
            "</text>",
            '<text x="50%" y="70%" class="base" dominant-baseline="middle" text-anchor="middle">',
            "Intelligence: ",
            intelligence.toString(),
            "</text>",
            "</svg>"
        );
        return
            string(
                abi.encodePacked(
                    "data:image/svg+xml;base64,",
                    Base64.encode(svg)
                )
            );
    }

    function getAttributes(uint256 tokenId)
        public
        view
        returns (
            string memory name,
            string memory class,
            uint256 level,
            uint256 agility,
            uint256 strength,
            uint256 intelligence
        )
    {
        Character storage character = tokenIdToCharacter[tokenId];
        return (
            character.name,
            character.class,
            character.level,
            character.agility,
            character.strength,
            character.intelligence
        );
    }

    function getTokenURI(uint256 tokenId) public view returns (string memory) {
        bytes memory dataURI = abi.encodePacked(
            "{",
            '"name": "Chain Battles #',
            tokenId.toString(),
            '",',
            '"description": "Battles on chain",',
            '"image": "',
            generateCharacter(tokenId),
            '"',
            "}"
        );
        return
            string(
                abi.encodePacked(
                    "data:application/json;base64,",
                    Base64.encode(dataURI)
                )
            );
    }

    function mint(string memory name) public {
        _tokenIds.increment();
        uint256 newItemId = _tokenIds.current();
        _safeMint(msg.sender, newItemId);
        Character memory newCharacter = Character(name, classes[randMod(CLASS_SIZE)], 1, randMod(10), randMod(10), randMod(10));
        tokenIdToCharacter[newItemId] = newCharacter;
        _setTokenURI(newItemId, getTokenURI(newItemId));
    }

    function train(uint256 tokenId) public {
        require(_exists(tokenId));
        require(
            ownerOf(tokenId) == msg.sender,
            "You must own this NFT to train it!"
        );
        Character storage character = tokenIdToCharacter[tokenId];
        character.level++;
        character.agility = character.agility.add(randMod(5));
        character.strength = character.strength.add(randMod(5));
        character.intelligence = character.intelligence.add(randMod(5));
        _setTokenURI(tokenId, getTokenURI(tokenId));
    }
}
