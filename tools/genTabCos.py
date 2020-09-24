import math

tab_Cos = []
def main():

    for ii in range(0,256):
        tab_Cos.append(round(math.cos(ii*math.pi/128)*127+128))
        #print (",", round(v))
    print (tab_Cos)
if __name__ == '__main__':
    main()
