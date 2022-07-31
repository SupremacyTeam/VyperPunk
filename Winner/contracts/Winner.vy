# Author by Supremacy Inc.
# @version ^0.3.0

winner: public(address)
prev: public(address)
prize: public(uint256)

event Status:
    success: bool

@external
@payable
def __init__():
    self.winner = msg.sender
    self.prize = msg.value

@external
@payable
def __default__():
    assert msg.value > self.prize
    send(self.winner, msg.value)
    self.prev = self.winner
    self.winner = msg.sender
    self.prize = msg.value

@external
@view
def getWinner() -> address:
    if self.winner.is_contract:
        if self.winner != self.prev:
            log Status(True)
            return self.winner
        else:
            log Status(False)
            raise
    else:
        raise