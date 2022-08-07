from brownie import accounts, Vault, ERC20, Exp
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

    vault = Vault.deploy(
        WETH, {
        'from': deployer
    })

    WETH.approve(
        vault,
        31337e18, {
        'from': deployer
    })

    WETH.transfer(
        hacker,
        10e18, {
        'from': deployer
    })

    vault.deposit(
        31337e18, {
        'from': deployer
    })

    exp = Exp.deploy({
        'from': hacker
    })

    ##############################
    #     Write Exp code here    #
    #         /\_/\   /          #
    #    ____/ o o \             #
    #  /~____  =ø= /             #
    # (______)__m_m)             #
    ##############################

    
