# Author by Supremacy Inc. #
# @version ^0.3.0

from vyper.interfaces import ERC20

interface IFlashLoanReceiver:
    def executeOperation(borrower: address, amount: uint256) -> bool: nonpayable

owner: public(address)
token: public(ERC20)
reserve: public(uint256)
balanceOf: public(HashMap[address, uint256])

event Status:
    success: bool

event Deposit:
    user: indexed(address)
    amount: uint256

event Withdraw:
    user: indexed(address)
    amount: uint256

@external
def __init__(_token: ERC20):
    self.owner = msg.sender
    self.token = _token

@external
def deposit(_amount: uint256):
    assert self.token.balanceOf(msg.sender) >= _amount
    assert self.token.allowance(msg.sender, self) >= _amount
    self.token.transferFrom(msg.sender, self, _amount)
    self.balanceOf[msg.sender] += _amount
    self.reserve += _amount
    log Deposit(msg.sender, _amount)

@external
def withdraw(_amount: uint256):
    assert self.token.balanceOf(self) >= _amount
    assert self.balanceOf[msg.sender] >= _amount
    self.balanceOf[msg.sender] -= _amount
    self.reserve -= _amount
    self.token.transfer(msg.sender, _amount)
    log Withdraw(msg.sender, _amount)

@external
def flashLoan(_amount: uint256) -> bool:
    before: uint256 = self.token.balanceOf(self)
    assert before >= _amount
    assert msg.sender.is_contract
    self.token.transfer(msg.sender, _amount)
    assert (IFlashLoanReceiver(msg.sender).executeOperation(msg.sender, _amount))
    after: uint256 = self.token.balanceOf(self)
    assert after >= before, "Excuse me?"
    return True

@external
def status() -> bool:
    assert self.token.balanceOf(self) == 0
    log Status(True)
    return True