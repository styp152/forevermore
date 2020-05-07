# Marriage Contracts

Smart contract to get marriage on the blockchain!

## Getting Started
Simply download the required packages from the client folder.

```
npm install
```

The contracts folder keeps a copy of the contract in Solidity. The migrations folder keeps Truffle deployment files.

### Prerequisites
You must download Truffle in order to compile and migrate updated contracts.

```
npm install -g truffle
```

The Ganache GUI was also used during the development process -> Ganache

## Deployment

Prerequisite: [create an Infura Account](https://infura.io/register)

Create an .env file with these two variable INFURA_API_KEY and MNENOMIC

  $ truffle compile

After that you can choice what network (`ropsten`, `kovan`, `rinkeby`, `main`)  you can send the contract

  $ truffle migrate --network choice
