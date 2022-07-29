# Author by Supremacy Inc. #

event Status:
    success: bool

#############################
#               Excuse me?  #
#         /\_/\   /         #
#    ____/ o o \            #
#  /~____  =ø= /            #
# (______)__m_m)            #
#############################

@external
def checkBalance():
    if self.balance > 0:
        log Status(True)
    else:
        log Status(False)