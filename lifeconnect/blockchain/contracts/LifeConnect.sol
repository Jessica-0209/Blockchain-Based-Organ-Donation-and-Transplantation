// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract LifeConnect {
    struct Recipient {
        string name;
        uint age;
        string bloodType;
        address wallet;
    }

    struct Donor {
        string name;
        uint age;
        string bloodType;
        bool isAvailable;
        address wallet;
    }

    mapping(address => Recipient) public recipients;
    mapping(address => Donor) public donors;

    function registerRecipient(string memory _name, uint _age, string memory _bloodType) public {
        recipients[msg.sender] = Recipient(_name, _age, _bloodType, msg.sender);
    }

    function registerDonor(string memory _name, uint _age, string memory _bloodType, bool _isAvailable) public {
        donors[msg.sender] = Donor(_name, _age, _bloodType, _isAvailable, msg.sender);
    }

    function getRecipient(address _addr) public view returns (string memory, uint, string memory) {
        Recipient memory r = recipients[_addr];
        return (r.name, r.age, r.bloodType);
    }

    function getDonor(address _addr) public view returns (string memory, uint, string memory, bool) {
        Donor memory d = donors[_addr];
        return (d.name, d.age, d.bloodType, d.isAvailable);
    }
}
