from brownie import accounts, Dex, ERC20
from rich import print as rp

def main():
    rp('[bold green]------------ Supremacy Inc. ------------[/]')
    rp('[bold green]-------------- VyperPunk --------------[/]\n')
    deployer = accounts[0]
    hacker = accounts.at('0xc95C558dAA63b1A79331B2AB4a2a7af375384d3B', force=True)

    token0 = ERC20.deploy(
        "WETH",
        "WETH",
        18,
        1e20, {
    'from': deployer
    })
    token1 = ERC20.deploy(
        "WBTC",
        "WBTC",
        18,
        1e20, {
    'from': deployer
    })

    dex = Dex.deploy(token0, token1, {
        'from': deployer
    })

    token0.transfer(dex, 100e18, {
        'from': deployer
    })
    token1.transfer(dex, 100e18, {
        'from': deployer
    })

    token0.transfer(hacker, 10e18, {
        'from': deployer
    })
    token1.transfer(hacker, 10e18, {
        'from': deployer
    })

    ##############################
    #     Write Exp code here    #
    #         /\_/\   /          #
    #    ____/ o o \             #
    #  /~____  =ø= /             #
    # (______)__m_m)             #
    ##############################

