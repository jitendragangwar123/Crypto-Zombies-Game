#### how you can use npm to install a package and make it available globally:-
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
### Truffle to sign transactions, we are going to need a tool called truffle-hdwallet-provider:-
```shell
 npm install truffle truffle-hdwallet-provider
```
 ### initialize our new project by running truffle init:-
 ```shell
 truffle init
 ```
### To create the build artifacts and place them in the ./build/contracts directory:-
```shell
truffle compile
```
