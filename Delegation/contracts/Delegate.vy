# Author by Supremacy Inc. #
# @version ^0.3.0

owner: public(address)

@external
def __init__():
    self.owner = msg.sender

@external
def pwn():
    assert msg.sender != self
    self.owner = msg.sender
