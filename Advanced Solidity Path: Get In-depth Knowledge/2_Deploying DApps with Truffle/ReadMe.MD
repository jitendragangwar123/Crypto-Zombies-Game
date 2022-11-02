#### How you can use npm to install a package and make it available globally:-
```shell
npm install truffle -g

```
#### All it is doing is to create a set of folders and config files with the following structure:-
```shell
├── contracts
    ├── Migrations.sol
├── migrations
    ├── 1_initial_migration.js
└── test
truffle-config.js
truffle.js
```
:- Migrations: a migration is a JavaScript file that tells Truffle how to deploy a smart contract.
:- truffle.js and truffle-config.js: config files used to store the network settings for deployment.

### Truffle to sign transactions, we are going to need a tool called truffle-hdwallet-provider:-
```shell
 npm install truffle truffle-hdwallet-provider
```
### Initialize our new project by running truffle init:-
 ```shell
 truffle init
 ```
### To create the build artifacts and place them in the ./build/contracts directory:-
```shell
truffle compile
```
### To deploy the smart contract:- 
```shell
truffle migrate --network rinkeby
``` 

HD Wallet-enabled Web3 provider:-
        Use it to sign transactions for addresses derived from a 12 or 25 word mnemonic.
```shell
const HDWalletProvider = require("truffle-hdwallet-provider");
```
Mnemonic:-
    Mnemonic phrases are a human-readable version of the private keys.
    Mnemonic or seed phrases can range from 12 - 25 words depending on the blockchain ecosystem you are dealing with.
    
    
/*
Loom Basechain:-
        Conversely, on Loom, your users can have much speedier and gas-free transactions, making it a much better fit for games and other non-financial applications.
```shell
npm install loom-truffle-provider
```
*/
    
