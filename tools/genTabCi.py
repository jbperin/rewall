
import math
from table import CosTable

def main():
    for ii in range (-20, 20, 1):
        # v=((2**18)/(CosTable [abs(ii)]*2))
        v=(2**19)/(CosTable [abs(ii)])
        print (",", round(v))

if __name__ == '__main__':
    main()
