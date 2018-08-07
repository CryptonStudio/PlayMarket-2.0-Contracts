pragma solidity ^0.4.21;

/**
 * @title Ownable contract - base contract with an owner
 */
contract Ownable {
  
  address public owner;
  address public newOwner;

  event OwnershipTransferred(address indexed _from, address indexed _to);
  
  /**
   * @dev The Ownable constructor sets the original `owner` of the contract to the sender
   * account.
   */
  function Ownable() public {
    owner = msg.sender;
  }

  /**
   * @dev Throws if called by any account other than the owner.
   */
  modifier onlyOwner() {
    assert(msg.sender == owner);
    _;
  }

  /**
   * @dev Allows the current owner to transfer control of the contract to a newOwner.
   * @param _newOwner The address to transfer ownership to.
   */
  function transferOwnership(address _newOwner) public onlyOwner {
    assert(_newOwner != address(0));      
    newOwner = _newOwner;
  }

  /**
   * @dev Accept transferOwnership.
   */
  function acceptOwnership() public {
    if (msg.sender == newOwner) {
      emit OwnershipTransferred(owner, newOwner);
      owner = newOwner;
    }
  }
}

/**
 * @title Agent contract - base contract with an agent
 */
contract Agent is Ownable {
  address public adrAgent;
  
  function Agent() public {
    adrAgent = msg.sender;
  }
  
  modifier onlyAgent() {
    assert(msg.sender == adrAgent);
    _;
  }
  
  function setAgent(address _adrAgent) public onlyOwner{
    adrAgent = _adrAgent;
  }
  
}

/**
 * @title Logs contract - basic contract for working with logs
 */
contract Logs is Agent{
  
  //App events 
  event registrationApplicationEvent(uint idApp, string hash, string hashTag, bool publish, uint256 price, address adrDev);
  event changeHashEvent(uint idApp, string hash, string hashTag);
  event changePublishEvent(uint idApp, bool publish);
  event changePriceEvent(uint idApp, uint256 price);
  event buyAppEvent(address indexed user, address indexed developer, uint idApp, address indexed adrNode, uint256 price);
  
  //Ico App events 
  event registrationApplicationICOEvent(uint idApp, string hash, string hashTag);
  event changeIcoHashEvent(uint idApp, string hash, string hashTag);
  
  //Developer events 
  event registrationDeveloperEvent(address indexed developer, bytes32 name, bytes32 info);
  event changeDeveloperInfoEvent(address indexed developer, bytes32 name, bytes32 info);
  event confirmationDeveloperEvent(address indexed developer, bool value);
  
  //Node events
  event registrationNodeEvent(address indexed adrNode, bool confirmation, string hash, string hashTag, uint256 deposit, string ip, string coordinates);
  event confirmationNodeEvent(address adrNode, bool value);
  event makeDepositEvent(address indexed adrNode, uint256 deposit);
  event takeDepositEvent(address indexed adrNode, uint256 deposit);
  event changeInfoNodeEvent(address adrNode, string hash, string hashTag, string ip, string coordinates);
  
  //Reviews events
  event newRating(address voter , uint idApp, uint vote, string description, bytes32 txIndex, uint256 blocktimestamp);
  
  //ICO events 
  event releaseICOEvent(address adrDev, uint idApp, bool release, address ICO);
  event newContractEvent(string name, string symbol, address adrDev, uint idApp);
  
  function registrationApplicationEvent_(uint idApp, string hash, string hashTag, bool publish, uint256 price, address adrDev) public onlyAgent {
    emit registrationApplicationEvent(idApp, hash, hashTag, publish, price, adrDev);
  }
  
  function changeHashEvent_(uint idApp, string hash, string hashTag) public onlyAgent {
    emit changeHashEvent(idApp, hash, hashTag);
  }
  
  function changePublishEvent_(uint idApp, bool publish) public onlyAgent {
    emit changePublishEvent(idApp, publish);
  }
  
  function changePriceEvent_(uint idApp, uint256 price) public onlyAgent {
    emit changePriceEvent(idApp, price);
  }
  
  function buyAppEvent_(address user, address developer, uint idApp, address adrNode, uint256 price) public onlyAgent {
    emit buyAppEvent(user, developer, idApp, adrNode, price);
  }
  
  function registrationApplicationICOEvent_(uint idApp, string hash, string hashTag) public onlyAgent {
    emit registrationApplicationICOEvent(idApp, hash, hashTag);
  }
  
  function changeIcoHashEvent_(uint idApp, string hash, string hashTag) public onlyAgent {
    emit changeIcoHashEvent(idApp, hash, hashTag);
  }
  
  function registrationDeveloperEvent_(address developer, bytes32 name, bytes32 info) public onlyAgent {
    emit registrationDeveloperEvent(developer, name, info);
  }
  
  function changeDeveloperInfoEvent_(address developer, bytes32 name, bytes32 info) public onlyAgent {
    emit changeDeveloperInfoEvent(developer, name, info);
  }
  
  function confirmationDeveloperEvent_(address developer, bool value) public onlyAgent {
    emit confirmationDeveloperEvent(developer, value);
  }
  
  function registrationNodeEvent_(address adrNode, bool confirmation, string hash, string hashTag, uint256 deposit, string ip, string coordinates) public onlyAgent {
    emit registrationNodeEvent(adrNode, confirmation, hash, hashTag, deposit, ip, coordinates);
  }
  
  function confirmationNodeEvent_(address adrNode, bool value) public onlyAgent {
    emit confirmationNodeEvent(adrNode, value);
  }
  
  function makeDepositEvent_(address adrNode, uint256 deposit) public onlyAgent {
    emit makeDepositEvent(adrNode, deposit);
  }
  
  function takeDepositEvent_(address adrNode, uint256 deposit) public onlyAgent {
    emit takeDepositEvent(adrNode, deposit);
  }
  
  function changeInfoNodeEvent_(address adrNode, string hash, string hashTag, string ip, string coordinates) public onlyAgent {
    emit changeInfoNodeEvent(adrNode, hash, hashTag, ip, coordinates);
  }
  
  function newRating_(address voter , uint idApp, uint vote, string description, bytes32 txIndex, uint256 blocktimestamp) public onlyAgent {
    emit newRating(voter , idApp, vote, description, txIndex, blocktimestamp);
  }
  
  function releaseICOEvent_(address adrDev, uint idApp, bool release, address ICO) public onlyAgent {
    emit releaseICOEvent(adrDev, idApp, release, ICO);
  }
  
  function newContractEvent_(string name, string symbol, address adrDev, uint idApp) public onlyAgent {
    emit newContractEvent(name, symbol, adrDev, idApp);
  }
}