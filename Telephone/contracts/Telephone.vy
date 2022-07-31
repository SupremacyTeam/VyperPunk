# Author by Supremacy Inc.
# @version ^0.3.0

owner: public(address)
balanceOf: public(HashMap[address, uint256])

event Status:
    success: bool

@external
@payable
def __init__():
    self.owner = msg.sender
    self.balanceOf[msg.sender] = msg.value

@external
def callMe():
    assert msg.sender != tx.origin
    self.owner = msg.sender

@external
def withdraw():
    assert msg.sender == self.owner
    send(msg.sender, self.balance)
    log Status(True)