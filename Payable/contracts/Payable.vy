# Author by Supremacy Inc. #
# @version ^0.3.0

owner: public(address)
contributions: public(HashMap[address, uint256])

event Payment:
    sender: indexed(address)
    amount: uint256

event Status:
    success: bool

@external
def __init__():
    self.owner = msg.sender
    self.contributions[msg.sender] = as_wei_value(31337, "ether")

@external
@payable
def contribute():
    assert msg.value < as_wei_value(0.0001, "ether")
    self.contributions[msg.sender] += msg.value
    if self.contributions[msg.sender] > self.contributions[self.owner]:
        self.owner = msg.sender

@external
@view
def getContribution() -> uint256:
    return self.contributions[msg.sender]

@external
def withdraw():
    assert msg.sender == self.owner
    send(msg.sender, self.balance)

@external
@payable
def __default__():
    log Payment(msg.sender, msg.value)
    if (msg.value > 0 and self.contributions[msg.sender] > 0):
        self.owner = msg.sender
    else:
        pass

@external
def status() -> bool:
    if (msg.sender == self.owner):
        log Status(True)
        return True
    else:
        log Status(False)
        return False
