# Author by Supremacy Inc. #
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
@payable
def deposit():
    assert msg.value > 0
    self.balanceOf[msg.sender] += msg.value

@external
def withdraw(_amount: uint256) -> bool:
    assert self.balanceOf[msg.sender] >= _amount
    send(msg.sender, _amount)
    self.balanceOf[msg.sender] -= _amount
    return True

@external
def status() -> bool:
    if self.balance == 0:
        log Status(True)
        return True
    else:
        log Status(False)
        return False