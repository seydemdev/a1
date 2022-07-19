# Vending Machine
**Vending machine which lets you purchase donuts, restock donuts and see your balance of donuts.**

```
owner
```
*Deployer address of VendingMachine.sol*

```
donutBalances
```
*Donut balances of users.*

```
getVendingMachineBalance()
```
*Donut balances of vending machine. Important for `purchase()`*

```
restock()
```
*Increases amount of donuts in vending machine.*

```
purchase()
```
*Decreases amount of donuts in vending machine, gives caller donuts in exchange for ETH. 0.001 ETH per donut.*
