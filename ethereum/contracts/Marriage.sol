pragma solidity >=0.5.0 <0.7.0;


contract MarriageNotary {
    Marriage[] public registeredMarriages;

    event ContractCreated(Marriage contractAddress);

    function createMarriage(
        string memory _leftName,
        string memory _leftVows,
        string memory _rightName,
        string memory _rightVows,
        uint _date
    ) public {
        Marriage newMarriage = new Marriage(msg.sender, _leftName, _leftVows, _rightName, _rightVows, _date);

        emit ContractCreated(newMarriage);
        // saving the address so a front-end client can find it
        registeredMarriages.push(newMarriage);
    }

    function getDeployedMarriages() public view returns (Marriage[] memory) {
        return registeredMarriages;
    }
}


contract Marriage {

    // Owner address
    address payable public owner;

    // Marriage contract details
    string public leftName;
    string public leftVows;
    string public rightName;
    string public rightVows;
    uint public marriageDate;

    constructor(
        address payable _owner,
        string memory _leftName,
        string memory _leftVows,
        string memory _rightName,
        string memory _rightVows,
        uint _date
    ) public {
        owner = _owner;
        leftName = _leftName;
        leftVows = _leftVows;
        rightName = _rightName;
        rightVows = _rightVows;
        marriageDate = _date;
    }

    modifier onlyOwner() {
      require(msg.sender == owner);
      _;
    }

    // ringBell is a payable function that allows people to celebrate the couple's
    // marriage by sending Ethers to the marriage contract
    function ringBell() public payable {
        require(msg.value > .0001 ether);
    }

    function collect() external onlyOwner {
        owner.transfer(address(this).balance);
    }

    // Allow only owners the check the balance of the contract
    function getBalance() public view onlyOwner returns (uint) {
        return address(this).balance;
    }

}
