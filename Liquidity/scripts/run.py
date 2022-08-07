from brownie import accounts, Liquidity, ERC20, Exp
from rich import print as rp

def main():
    rp('[bold green]------------ Supremacy Inc. ------------[/]')
    rp('[bold green] ------------- VyperPunk --------------[/]\n')
    deployer = accounts[0]
    hacker = accounts.at('0xc95C558dAA63b1A79331B2AB4a2a7af375384d3B', force=True)

    WETH = ERC20.deploy(
        "WETH",
        "WETH",
        18,
        1e30, {
    'from': deployer
    })

    liquidity = Liquidity.deploy({
        'from': deployer
    })

    WETH.transfer(
        liquidity,
        31337e18, {
        'from': deployer
    })

    exp = Exp.depoly({
        'from': hacker
    })

    ##############################
    #     Write Exp code here    #
    #         /\_/\   /          #
    #    ____/ o o \             #
    #  /~____  =ø= /             #
    # (______)__m_m)             #
    ##############################

    
