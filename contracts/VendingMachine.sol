error NotOwner();
error InsufficientAmount();

contract VendingMachine {

    address public immutable owner;

    mapping(address => uint256) public donutBalances;

    constructor() {
        owner = msg.sender;
        donutBalances[address(this)] = 100;
    }

    function getVendingMachineBalance() external view returns (uint256) {
        return donutBalances[address(this)];
    }

    function restock(uint256 amount) external {
        if (msg.sender != owner) revert NotOwner();
        donutBalances[address(this)] += amount;
    }

    function purchase(uint256 amount) external payable {
        if (msg.value < amount * 1 ether) revert InsufficientAmount();
        if (donutBalances[address(this)] < amount) revert InsufficientAmount();
        donutBalances[address(this)] -= amount;
        donutBalances[msg.sender] += amount;
    }
}
