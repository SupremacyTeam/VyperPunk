from brownie import accounts, Delegate, Delegation, Contract
from rich import print as rp

def main():
    rp('[bold green]------------ Supremacy Inc. ------------[/]')
    rp('[bold green]-------------- VyperPunk --------------[/]\n')
    deployer = accounts[0]
    hacker = accounts.at('0xc95C558dAA63b1A79331B2AB4a2a7af375384d3B', force=True)

    delegate = Delegate.deploy({
        'from': deployer
    })

    delegation = Delegation.deploy(delegate, {
        'from': deployer
    })

    ##############################
    #     Write Exp code here    #
    #         /\_/\   /          #
    #    ____/ o o \             #
    #  /~____  =ø= /             #
    # (______)__m_m)             #
    ##############################

    addr = delegation.owner()

    if addr == hacker:
        rp('[bold green]Hacker Address:', addr, '\n')

        rp('[bold green]-------------- End --------------[/]')
    else:
        rp('[bold green]The game isn\'t over yet!')
