# Author by Supremacy Inc. #
# @version ^0.3.0

owner: public(address)
delegate: public(address)

event Status:
    success: bool

@external
def __init__(_addr: address):
    self.delegate = _addr
    self.owner = msg.sender

@external
@payable
def __default__():
    raw_call(
        self.delegate,
        slice(msg.data, 0, 4),
        is_delegate_call=True
        )

@external
def checkOwnership():
    assert msg.sender == self.owner
    log Status(True)