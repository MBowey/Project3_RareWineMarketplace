# Project3_RareWineMarketplace

**Contributors: Alice Lin, Andre Bacellar, Benny Adler, Michael Bowey, Rina Niles** 

![Wine Bottles](/Images/bitcoin_wine.png)


## Overview

RareWineMarket is an online application for users to register, trade and auction their collection of rare wine. Utilizing blockchain technology, users are able to mint an NFT (ERC721 Token) that represents a digital claim on their bottle to be bought or sold. In practice, each bottle would be registered for authenticity and recorded on the blockchain for verifitcation.

The two main objective of this presentation were:

1. Test potential use case for buying/selling physical goods digitally via NFT architecture

2. Learn about **The Graph** infrastructure protocol used by:
    * Uniswap
    * AAVE
    * Decentraland

## Tech Stack

* FRONT-END:  React, Web3.js, Ant, Metamask
* MIDDLEWARE: The Graph, IPFS, Etherscan
* BACK-END: Hardhat, Yarn, Remix (Testing)

## Installation

* Step 1: Clone Github Repo and `cd` to the `wine-auction` directory

* Step 2: Install dependencies

``` Bash
yarn install
```

* Step 3: Star your local blockahin with `Hardhat`

``` bash
yarn chain
```

* Step 4: Upload the json files with information regarding your bottles of wine

``` bash
yarn start
```

* Step 5: Start your front end with `React`

``` bash
yarn deploy
```

* Step 6: Deploy your smart contracts

``` bash
yarn upload
```

## What is The Graph
The Graph is a decentralized protocol for indexing and querying data from blockchains, starting with Ethereum. It makes it possible to query data that is difficult to query directly.

Even for this relatively simple question such as who are the owners of the token123 between year x and year y, it would take hours, or even days, for a decentralized application (dApp) running in a browser to get an answer. The Graph solves this today with a hosted service that indexes blockchain data. These indexes ("subgraphs") can then be queried with a standard GraphQL (Query Language) API. In the future, the hosted service will evolve into a fully decentralized protocol with the same capabilities. Both are backed by the open source implementation of Graph Node.

### How The Graph Works#
The Graph learns what and how to index Ethereum data based on subgraph descriptions, known as the subgraph manifest. The subgraph description defines the smart contracts of interest for a subgraph, the events in those contracts to pay attention to, and how to map event data to data that The Graph will store in its database.

Once you have written a subgraph manifest, you use the Graph CLI to store the definition in IPFS and tell the hosted service to start indexing data for that subgraph.

This diagram gives more detail about the flow of data once a subgraph manifest has been deployed, dealing with Ethereum transactions:

![The Graph](/Images/thegraph.png)

The flow follows these steps:

* Step 1: A decentralized application adds data to Ethereum through a transaction on a smart contract.
The smart contract emits one or more events while processing the transaction.

* Step 2: Graph Node continually scans Ethereum for new blocks and the data for your subgraph they may contain. 

* Step 3: Graph Node finds Ethereum events for your subgraph in these blocks and runs the mapping handlers you provided. The mapping is a WASM module that creates or updates the data entities that Graph Node stores in response to Ethereum events.

* Step4: The decentralized application queries the Graph Node for data indexed from the blockchain, using the node's GraphQL endpoint. The Graph Node in turn translates the GraphQL queries into queries for its underlying data store in order to fetch this data, making use of the store's indexing capabilities. 

* Step5: The decentralized application displays this data in a rich UI for end-users, which they use to issue new transactions on Ethereum. The cycle repeats.


## Smart Contract

* Bottle Registry (ERC721 Token)      

* Bottle Registry (ERC721 Token)  
    * creatAuction
    * endAuction
    * highestBid
    * pendingReturn
    * bid

* Contract


## Building Front End Via Graph

![Rest vs Graph](/Images/rest_vs_graphql.jpeg)

## Business Case

A main factor in determining the value of fine wines is 'Provenance', which refers to the purchase, ownership, and storage history of a wine.

Currently, provenance for fine wines is determined by two main factors: 1) an expert who evaluates signs of authenticity, and 2) the reputation of the person selling wine.  Inspecting wine is expensive and time-consuming process; relying on the seller’s reputation is also risky for all the obvious reasons.

Blockchain technology solves this problem, as it provides provenance through the minting of NFTs. With the VINO dapp, ff a winery were to specify in an asset contract that collectors could take physical delivery far into the future, the winery could begin to function like a bank. There could be a vibrant market trading digital wine contracts, backed by wine reserves which are held securely by the winery and rarely redeemed until the wine is ready for consumption. With smart chip technology, the temperature with which the wine was subjected to over time, as well as any tampering with the cork, can also be tracked and recorded on-chain for verification.


## Next Steps

* Centralized warehouse for bottle storage and maintenance
* VINO holders can show off their collection virtually via online gallery
* Holders can buy or sell their bottles without actually having to move the physical
* If a holder decides they want to drink their bottle, they can burn their token in exchange for the physical bottle and receive an “Open bottle” NFT 
* Open bottle tokens can be used to show off bottles the holder has previously owned but cannot be exchanged for a physical.
* VINO makes money as a business by taking a small percentage of every transaction🤑🤑🤑
