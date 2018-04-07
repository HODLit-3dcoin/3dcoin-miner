# 3dcoin-miner

[![](https://images.microbadger.com/badges/version/hodlitio/3dcoin-miner.svg)](https://microbadger.com/images/hodlitio/3dcoin-miner "Get your own version badge on microbadger.com")
[![](https://images.microbadger.com/badges/image/hodlitio/3dcoin-miner.svg)](https://microbadger.com/images/hodlitio/3dcoin-miner "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/commit/hodlitio/3dcoin-miner.svg)](https://microbadger.com/images/hodlitio/3dcoin-miner "Get your own commit badge on microbadger.com")

## What is 3dcoin-miner project?
This is a Docker image that starts a 3dcoin daemon an start solo CPU mining. In future, there will be GPU mining and mining pools, and if we get enough support from community, we will gladly prepare images for them too when core developers release them.

## Is it free?
Anyone can use this image whenever they like. It is MIT licensed so do whatever you want with it, we are not responsible for anything caused by the usage of it. However, we are taking a fee of two 3DC per block found. Currently, a miner generates 22 3DC per block they find, so that makes 2 coins for us and 20 coins for you. We are always open for community to decide on our fee, so feel free to voice your opinion if you find it too high or too low. We felt 2 was a reasonable amount as we managed to make everything work with one press of a button.

## What are the requirements?
You need to have Docker installed. How? Check out our [Digital Ocean](https://www.digitalocean.com/?refcode=fc06220e24cc) Ubuntu 16.04 image security hardening guide.

## I have Docker installed, now what?
You just have to run the command below, that's all:

    docker run -d --name hodlit-miner hodlitio/3dcoin-miner REPLACE_WITH_CPU_COUNT REPLACE_THIS_WITH_YOUR_3DC_WALLET_ADDRESS

here is a concrete example (allocate 4 cpu cores to the miner and send earnings to our wallet):

    docker run -d --name hodlit-miner hodlitio/3dcoin-miner 4 AaMmmB5c3DKYuQEeTB6vc5fPt8gsUnJaVz

a more extereme example (allocate all of your cpu cores to the miner and send earnings to our wallet):

    docker run -d --name hodlit-miner hodlitio/3dcoin-miner -1 AaMmmB5c3DKYuQEeTB6vc5fPt8gsUnJaVz

## I would like to support HODLit.io team
Thanks!

Bitcoin (BTC) donation address:
Ethereum (ETH) donation address:
Litecoin (LTC) donation address:
Monero (XRM) donation address:
3DCoin (3DC) donation address:

## I would like to contact HODLit.io team
Twitter:
Telegram:
