## Description
This is a simple dapp where users can:
* See products hosted on the Celo Blockchain
* Purchase products with cUSD and pay the owner
* Add your own products to the dapp
* Edit the Number of products availiable
* See the Metrics of the Market

## Live Demo
[Marketplace Dapp](https://dacadeorg.github.io/celo-marketplace-dapp/)

## Usage

### Requirements
1. Install the [CeloExtensionWallet](https://chrome.google.com/webstore/detail/celoextensionwallet/kkilomkmpmkbdnfelcpgckmpcaemjcdh?hl=en) from the Google Chrome Store.
2. Create a wallet.
3. Go to [https://celo.org/developers/faucet](https://celo.org/developers/faucet) and get tokens for the alfajores testnet.
4. Switch to the alfajores testnet in the CeloExtensionWallet.

### Test
1. Create a product.
2. Check if product metric increased.
3. Create a second account in your extension wallet and send them cUSD tokens.
4. Buy product with secondary account.
5. Check if sold metric increased.
6. Check if balance of first account increased.
7. Buy a product out, then restock.


## Project Setup

### Install
```
npm install
```

### Start
```
npm run dev
```

### Build
```
npm run build
