# Author by Supremacy Inc. #
# @version ^0.3.0

from vyper.interfaces import ERC20

owner: public(address)
token0: public(address)
token1: public(address)

event Status:
    success: bool

@external
def __init__(_token0: address, _token1: address):
    self.owner = msg.sender
    self.token0 = _token0
    self.token1 = _token1

@external
def addLiquidity(_token: address, _amount: uint256):
    assert msg.sender == self.owner
    assert (_token == self.token0 or _token == self.token1)
    ERC20(_token).transferFrom(msg.sender, self, _amount)

@internal
@view
def swapPrice(from_: address, to_: address, amount_: uint256) -> uint256:
    return ((amount_ * ERC20(to_).balanceOf(self) / ERC20(from_).balanceOf(self)))

@external
def swap(_from: address, _to: address, _amount: uint256) -> bool:
    assert ERC20(_from).balanceOf(msg.sender) >= _amount, "Not enough to swap!"
    amount: uint256 = self.swapPrice(_from, _to, _amount)
    assert ERC20(_to).balanceOf(self) >= amount, "Not enough to swap!"
    ERC20(_from).transferFrom(msg.sender, self, _amount)
    ERC20(_to).transfer(msg.sender, amount)
    return True

@external
def status() -> bool:
    assert (ERC20(self.token0).balanceOf(self) == 0) or (ERC20(self.token1).balanceOf(self) == 0)
    log Status(True)
    return True