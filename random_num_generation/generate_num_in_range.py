from numpy import random 
import sys

if len(sys.argv) > 1:
    maxNum = sys.argv[1]
else:
    maxNum = 10
a = random.randint(maxNum)
print("generate a random int " + str(a) + ", smaller than " + str(maxNum))
