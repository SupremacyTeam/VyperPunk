# Author by Supremacy Inc. #
# @version ^0.3.0

interface IBall:
    def isGetBall(_score: uint256) -> bool: nonpayable

event Status:
    success: bool

owner: public(address)
SUCCESS: public(bool)
score: public(uint256)

@external
def __init__():
    self.owner = msg.sender

@external
def goto(_score: uint256):
    if not (IBall(msg.sender).isGetBall(_score)):
        self.score = _score
        self.SUCCESS = IBall(msg.sender).isGetBall(_score)
    else:
        raise

@external
def status() -> bool:
    if (self.SUCCESS):
        log Status(True) 
        return True
    else:
        log Status(False)
        return False