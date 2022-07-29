# Author by Supremacy Inc.

owner: public(address)
isSold: public(bool)
PRICE: public(uint256)

event Status:
    success: bool

interface Buyer:
    def price() -> uint256: view

@external
def __init__():
    self.PRICE = 31337

@external
def changePrice():
    assert Buyer(msg.sender).price() > self.PRICE
    self.isSold = True
    self.PRICE = Buyer(msg.sender).price()

@external
def status() -> bool:
    if self.PRICE == 1337:
        log Status(True)
        return True
    else:
        log Status(False)
        return False