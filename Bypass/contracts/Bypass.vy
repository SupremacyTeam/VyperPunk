# Author by Supremacy Inc.
# @version ^0.3.0

owner: public(address)

event Status:
    success: bool

@external
def __init__():
    self.owner = msg.sender

@external
def bypassCase() -> bool:
    _addr: address = msg.sender
    assert msg.sender != tx.origin
    assert _addr.codesize == 0
    self.owner = msg.sender
    assert msg.sender == self.owner
    return True
