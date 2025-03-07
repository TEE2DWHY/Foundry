// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract SimpleStorage {
    uint256 public age;
    People[] public person;

    struct People {
        string name;
        uint256 favouriteNumber;
    }

    mapping(string => uint256) public nameToFavouriteNumber;

    function newAge(uint256 _age) public {
        age = _age;
        age = age + 2;
    }

    function retrieve() public view returns (uint256) {
        return age;
    }

    function birthday() public view returns (uint256) {
        uint256 _newAge = age + 1;
        return _newAge;
    }

    function addPerson(string memory _name, uint256 _favouriteNumber) public {
        person.push(People(_name, _favouriteNumber));
        nameToFavouriteNumber[_name] = _favouriteNumber;
    }
}
