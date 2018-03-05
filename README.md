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

## Note for HelloWorld sample contract
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