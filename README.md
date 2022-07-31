# VyperPunk

VyperPunk is a Web3.0 & Vyper based wargame inspired in overthewire.org & ethernaut.openzeppelin.com, to be played in the Ethereum Virtual Machine. Each level is a smart contract that needs to be 'hacked'.

The game acts both as a tool for those interested in learning ethereum, and as a way to catalogue historical hacks in levels. Levels can be infinite and the game does not require to be played in any particular order.

Level PR's are welcome!

## Supremacy Inc.

We believe that Vyper is a completely underrated language and that the Solidity language is currently a leader in the EVM compatible chain ecosystem, due to the size of their community and code reuse. 

We hope that this project will help Vyper to build up community awareness and get more engineers and security researchers who want to get started with Vyperlang to join the ecosystem and grow the Vyperlang ecosystem :)

## Flow

This project is built using `eth-brownie`, so you will need to have this tool installed on your computer.

Trick: When you execute a script file in the project using brownie run, Brownie will automatically compile it using Vyper, and if you haven't downloaded and installed the Vyperlang compiler before, then Brownie will automatically download and install it and compile it later.

```
pip install eth-brownie rich
```

Once installed write the appropriate Exp smart contract for the level, then write `scripts/run.py` and finally by running the command.

```
brownie run scripts/run.py
```

## License

VyperPunk is released under the MIT License.