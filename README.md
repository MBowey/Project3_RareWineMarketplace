# Project3_RareWineMarketplace

**Contributors:** Alice Lin, Andre Bacellar, Benny Adler, Michael Bowey, Rina Niles 

![Wine Bottles](/Images/crypto_wine.png)


## Overview

RareWineMarket is an online application for users to register, trade and auction their collection of rare wine. Utilizing blockchain technology, users are able to mint an NFT (ERC721 Token) that represents a digital claim on their bottle to be bought or sold. In practice, each bottle would be registered for authenticity and recorded on the blockchain for verifitcation.

The two main objective of this project were:

1. Test potential use case for buying/selling physical goods digitally via NFT architecture

2. Learn about **The Graph** infrastructure protocol used by popular Ethereum dApps
    * Uniswap
    * AAVE
    * Decentraland

## Tech Stack

* FRONT-END:  
    * React
    * Web3.js
    * Ant
    * Metamask

* MIDDLEWARE: 
    * The Graph
    * IPFS
    * Etherscan

* BACK-END: 
    * Hardhat
    * Remix 

## Installation

* Step 1: Clone Github Repo and `cd` to the `Wine-Auction` directory

* Step 2: Install dependencies

``` Bash
yarn install
```

* Step 3: Star your local blockahin with `Hardhat`

``` bash
yarn chain
```

* Step 4: Open a second terminal window and upload json files with information regarding your bottles of wine

``` bash
yarn upload
```

* Step 5: In your second terminal window, start your front end with `React`

``` bash
yarn start
```

* Step 6: Open a third terminal window and deploy your smart contracts

``` bash
yarn deploy
```

## What is The Graph
The Graph is a decentralized protocol for indexing and querying data from blockchains, starting with Ethereum. It makes it possible to query data that is difficult to query directly.

Without Graph, if a user wanted to know who the owners were/are of a specific NFT for a specific time period, it would take hours, or even days, for a decentralized application (dApp) running in a browser to get an answer. The Graph solves this today with a hosted service that indexes blockchain data. These indexes ("subgraphs") can then be queried with a standard GraphQL (Query Language) API. In the future, the hosted service will evolve into a fully decentralized protocol with the same capabilities. Both are backed by the open source implementation of the Graph Node.

#### How The Graph Works
The Graph learns what and how to index Ethereum data based on subgraph descriptions, known as the subgraph manifest. The subgraph description defines the smart contracts of interest for a subgraph, the events in those contracts to pay attention to, and how to map event data to data that The Graph will store in its database. Once you have written a subgraph manifest, you use the Graph CLI to store the definition in IPFS and tell the hosted service to start indexing data for that subgraph.

This diagram gives more detail about the flow of data once a subgraph manifest has been deployed, dealing with Ethereum transactions:

![The Graph](/Images/thegraph.png)

Here is a `step-by-step` breakdown of the Graph Protocol workflow:

* **Step 1:** A decentralized application adds data to Ethereum through a transaction on a smart contract.
The smart contract emits one or more events while processing the transaction.

* **Step 2:** Graph Node continually scans Ethereum for new blocks and the data for your subgraph they may contain. Graph Node finds Ethereum events for your subgraph in these blocks and runs the mapping handlers you provided. The mapping is a WASM module that creates or updates the data entities that Graph Node stores in response to Ethereum events.

* **Step 3:** The decentralized application queries the Graph Node for data indexed from the blockchain, using the node's GraphQL endpoint. 

* **Step4:** The Graph Node in turn translates the GraphQL queries into queries for its underlying data store in order to fetch this data, making use of the store's indexing capabilities. 

* **Step5:** The decentralized application displays this data in a rich UI for end-users, which they use to issue new transactions on Ethereum. The cycle repeats.


## Smart Contract

The back-end smart contracts for this project can be broken down into three contracts. The first two were the most important for this project, in terms of setting up a contract that would mint a new NFT Wine Token and a building a contract for users to run an auction for their NFT Wine Token. The NFT Wine Token was built using the ERC721 standard provided and maintained by Open Zeppelin. The last contract is a placeholder to be able to layer on a revenue contract to the actual RareWineMarketplace in the form of transactions costs or listing fees. This would be included in next steps for the project.

Below are the links to the Solidity Contracts:

1. Bottle Registration [`YourCollectible.sol`](wine-auction/packages/hardhat/contracts/YourCollectible.sol)

2. Wine Auction  [`Auction.sol`](wine-auction/packages/hardhat/contracts/Auction.sol)

3. Overall Contract  [`YourContract.sol`](wine-auction/packages/hardhat/contracts/YourContract.sol)


## Front-End: User Interface

In terms of building the user interface, the process was simplified by being able to call the SubgraphURI endpoint. This would effectly allow us to Query any metaData associated with our NFT Wine Token including name, year, value, size, vineyard, region, description and images) that were uploaded to IPFS. From there, we used an existing `React` template to display our bottles of wine and run the auction using Metamask. The below diagram shows a nice visual comparing the workflow of GraphQL API versus a more traditional Rest API workflow.


![Rest vs Graph](/Images/rest_vs_graphql.jpeg)

## Business Case

A main factor in determining the value of fine wines is 'Provenance', which refers to the purchase, ownership, and storage history of a wine.

Currently, provenance for fine wines is determined by two main factors: 1) an expert who evaluates signs of authenticity, and 2) the reputation of the person selling the wine.  Inspecting wine is expensive and time-consuming process; relying on the seller’s reputation is also risky for all the obvious reasons.

Blockchain technology solves this problem, as it provides provenance through the minting of NFTs. With the VINO dapp, ff a winery were to specify in an asset contract that collectors could take physical delivery far into the future, the winery could begin to function like a bank. There could be a vibrant market trading digital wine contracts, backed by wine reserves which are held securely by the winery and rarely redeemed until the wine is ready for consumption. With smart chip technology, the temperature with which the wine was subjected to over time, as well as any tampering with the cork, can also be tracked and recorded on-chain for verification.


## Next Steps

* Centralized warehouse for bottle storage and maintenance
* VINO holders can show off their collection virtually via online gallery
* Holders can buy or sell their bottles without actually having to move the physical
* If a holder decides they want to drink their bottle, they can burn their token in exchange for the physical bottle and receive an “Open bottle” NFT 
* Open bottle tokens can be used to show off bottles the holder has previously owned but cannot be exchanged for a physical.
* VINO makes money as a business by taking a small percentage of every transaction

## References

* https://thegraph.com/blog/building-with-subgraph-studio
* https://github.com/dabit3/openzeppelin-nft-api 
* https://docs.scaffoldeth.io/scaffold-eth/ 
* https://github.com/ourzora/core 
