# Author by Supremacy Inc. #
# @version ^0.3.0

from vyper.interfaces import ERC20

interface IFlashLoanReceiver:
    def executeOperation(borrower: address, amount: uint256) -> bool: nonpayable

owner: public(address)
token: public(ERC20)

@external
def constructor(_token: ERC20):
    self.owner = msg.sender
    self.token = _token

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