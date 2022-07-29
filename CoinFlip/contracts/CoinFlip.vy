# Author by Supremacy Inc. #

FACTOR: public(uint256)
lastHash: public(uint256)
consecutiveWins: public(uint256)

event Status:
    success: bool

@external
def __init__():
    self.FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968
    self.consecutiveWins = 0

@external
def flip(_guess: bool) -> bool:
    blockValue: uint256 = convert(block.prevhash, uint256)
    if self.lastHash == blockValue:
        raise
        
    self.lastHash = blockValue
    coinFlip: uint256 = blockValue / self.FACTOR
    _side: bool = False
    if coinFlip == 1:
        _side = True
    else:
        _side = False
    if _side == _guess:
        self.consecutiveWins = self.consecutiveWins + 1
        return True
    else:
        self.consecutiveWins = 0
        return False

@external
def status() -> bool:
    if self.consecutiveWins == 17:
        log Status(True)
        return True
    else:
        log Status(False)
        return False