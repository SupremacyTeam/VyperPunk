from brownie import accounts, Winner, Exp
from rich import print as rp

def main():
    rp('[bold green]------------ Supremacy Inc. ------------[/]')
    rp('[bold green]-------------- VyperPunk --------------[/]\n')
    deployer = accounts[0]
    hacker = accounts.at('0xc95C558dAA63b1A79331B2AB4a2a7af375384d3B', force=True)

    winner = Winner.deploy({
        'from': deployer
    })

    exp = Exp.deploy(winner, {
        'from': hacker
    })

    exp.trigger({
        'from': hacker
    })
    
    rp('[bold green]-------------- End --------------[/]')
