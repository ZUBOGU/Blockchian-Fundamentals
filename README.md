# Blockchian-Fundamentals
Create a fully functional sample distributed application that ensures a secure and trustworthy product lifecycle trail for batches of food, using blockchain technology. Share secrets between collaborating parties in a blockchain

## Setting up Environment
Better to user Windows. 
> Chrome

> Metamask

> Visual Studio Code (Editor)

> npm

> Chocolatey

> GIT

> Windows Build Tools

> Test RPC (Server)

> Truffle (Development Framework)

### Commands and NPM install dependencies 
> Set-ExecutionPlicy -ExecutionPlicy RemoteSigned

> choco install git -params"/GitAndUnixToolsOnPath"

> git config --system http.sslverify false

> npm install -g node-gyp

> npm install --global --production windows-build-tools

> npm install -g ethereumjs-testrpc

> npm install -g truffle

## Note for HelloWorld simple contract
Use truffle to initial and use Visual Studio Code to edit code. 

Check truffle document

> http://truffleframework.com/docs/

> truffle init

> code . (After installation, launch VS Code. Now open the Command Palette (⇧⌘P) and type shell command to find the Shell Command: Install 'code' command in PATH command.)

Use testrpc to start the server. In order to use testrpc, set up in truffle.js

```
module.exports = {
  networks: {
      development: {
      host: "localhost",
      port: 8545,
      network_id: "*" // Match any network id
    }
  }
};
```
> testrpc

If you run ```truffle develop ```, you don't need testrpc anymore. ``` truffle develop ``` runs on port 9545. You have to modify your truffle.js to something like this

```
networks: {
    development: {
        host: "localhost",
        port: 9545,
        network_id: "*" // Match any network id
    }
}
```

Compile the contract.

> truffle compile

Deploy the contract.

> truffle migrate

We can communicate to the contract by using console mode. We are able to write JavaScript code directly. Asyc code to access our contracts. 

```
truffle console
var hw
HelloWorld.deployed().then(function(deployed){hw=deployed;});
hw.SayHello.call()
```

## Note for ScoreStore contract
```
truffle console
var ss
ScoreStore.deployed().then(function(deployed){ss=deployed;});
ss.AddPersonScore("zubo", 10);
ss.GetScore.call("zubo")
```


Deploy to production. Add into truffle.js
```
    production: {
      host: "xxxx.xxx.com", //ETHEREUM-RPC-ENDPOINT from azure without http part
      // remove port
      network_id: "*" // Match any network id
    }
```

Initial azure block-chain. SSH into azure.
```
ssh -p 3000 // plus the ssh address from azure
geth attach
personal.unlockAccount(eth.coinbase)
Enter Passphrase
```

Compile first then deploy.
```
truffle migrate --network production
truffle console --network production
// do the some check in local
```

## Calling External Functions
Create MyGame contract to call ScoreStore contract. Find the address from StoreStore.deployed().
```
truffle console
StoreStore.deployed()
```

Check the contract from console mode.
```
truffle console
var mg
MyGame.deployed().then(function(deployed){mg=deployed;});
mg.ShowScore.call("zubo").then(function(returnValue){console.log(returnValue);});
```

## Ethereum JavaScript API
Interact with Ethereum. Available through Web3.js. Make RPC calls. Work together with Metamask.

Truffle Webpack demo.

```
truffle unbox webpack
truffle compile
truffle migrate
npm run dev
```

Go to browser.
> http://localhost:8081/

Set Metamask with correct RPC
> http://localhost:8545/

Copy the private key from testrpc. Use this key to import account for Metamask.
Copy the address from another account and send 200 meta to that address. 
Refresh the page after switch account with Metamask will show the balance of META.

## FoodSafe Project
The different scenarios. Create a new contract for every new food. Ability to write and read information with right pass-phase.

Add create new contract logic to app.js.

In order to compile and send our contract directly to the blockchain via JavaScript rather than to user truffle.
We need to use solc compiler

```
npm install -g solc
```

```
web3.eth.compile.solidity(source_code)
```

This method in Web3 is deprecated. In order to read contract, we need to manually provide "ABI" and "CODE". This can get from "/build" folder, JSON file for the contract after ```truffle compile```. Check file ```app.js```

## Advanced Types

Structs: Custom defined types.

```
struct Person
{
	uint age;
	bool isCook;
	address accountAddress;
}

struct Parents
{
	Person father;
	Person mother;
}
```

Enum: List of finite set of values.
```
enum Gender { Male, Female, Non-Specified}
```

Arrays: Structure for grouping of elements.
```
string[] names;
Person[] persons;
Person[10] topTenAuthers;
topTenAuthers[3] = persons[5];
```

Mappings: Table of values.
```
mapping(address => uint) public balances;
return balances[account.Address];
```

Selfdestruct & delete: Killing a contract or deleting the content.
```
selfdestruct(msg.sender);
delete(objectArray);
```

Throwing Exceptions: Stop all operations and return unspent ether.
```
throw();
```

Commenting.
```
// Single line

/*
 Multi-line comment
*/

/// @notice Natspec comment
```
