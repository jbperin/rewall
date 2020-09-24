import math
from table import CosTable, Labyrinthe, tab_Ci_int

PosX, PosY = 2176, 1920
C = ((PosY // 2**8)+1) * 2**8
PosAngle = 0
step = 16 #64

TableVerticalPos = [0]*40
startAngle = 2
endAngle = 12

def RayCastFloat ():
    indexAngle = startAngle
    angle = PosAngle + 20 - startAngle
    while (angle > 11 ):
        angle_rad = angle * math.pi / 128

        xx=PosX;
        yy=PosY;

        ix= math.cos(angle_rad)*16 #(CosTable[angle]>>3)   -16;
        iy= math.cos(angle_rad+(math.pi/2))*16 #(CosTable[(angle+64)%256]>>3)-16;

        aStr = "indexAngle %d angle %d ix %f iy %f "%(indexAngle, angle, ix, iy)

        nbStep = 0;
        idx16 = (xx>>8) + ((yy>>8)<<4);
        labX, labY = (xx>>8) , (yy>>8)
        # float_dist = (C - PosY)/math.sin(angle_rad)
        # nbStep = math.ceil(float_dist//step)
        # print ("idx = " ,idx, "angle = ", angle, "nbStep = ", nbStep)
        # idx += 1

        while (Labyrinthe[idx16] != 1):
            xx = round(ix + xx)
            yy = round(iy + yy)

            nbStep+=1
            idx16 = (xx>>8) + ((yy>>8)<<4)
            labX, labY = (xx>>8) , (yy>>8)
            # print (f"\txx {xx} yy {yy} labX {labX} labY {labY}")
        if nbStep > 2:
            #div16b8_dividend = tab_Ci_int[indexAngle]
            distance = tab_Ci_int[indexAngle]//nbStep
            if (distance>100):
                TableVerticalPos[indexAngle]=0
            else:
                TableVerticalPos[indexAngle]=100-distance
        else:
            TableVerticalPos[indexAngle]=0
        aStr += "nbStep:%d, distance : %d ,hauteur = %d"%( nbStep, distance, TableVerticalPos[indexAngle]);
        print (aStr)

        indexAngle += 1

        angle -= 1


def RayCastInt ():

    angle=PosAngle+20-startAngle;

    for indexAngle in  range (startAngle,endAngle):
        # Vertical scan
        xx=PosX;
        yy=PosY;

        # Launch a ray scanning...
        # ix=(CosTable[angle]>>1)   -64;
        # iy=(CosTable[(angle+64)%256]>>1)-64;
        ix=(CosTable[angle]>>3)   -16;
        iy=(CosTable[(angle+64)%256]>>3)-16;

        aStr = "indexAngle %d angle %d ix %d iy %d "%(indexAngle, angle, ix, iy)

        nbStep = 0;
        idx16 = (xx>>8) + ((yy>>8)<<4);
        labX, labY = (xx>>8) , (yy>>8)
        while (Labyrinthe[idx16] != 1):
            xx+=ix
            yy+=iy

            nbStep+=1
            idx16 = (xx>>8) + ((yy>>8)<<4)
            labX, labY = (xx>>8) , (yy>>8)
            # print (f"\tstep {nbStep} xx {xx} yy {yy} labX {labX} labY {labY}")
        if nbStep > 2:
            #div16b8_dividend = tab_Ci_int[indexAngle]
            distance = tab_Ci_int[indexAngle]//nbStep
            if (distance>100):
                TableVerticalPos[indexAngle]=0
            else:
                TableVerticalPos[indexAngle]=100-distance
        else:
            TableVerticalPos[indexAngle]=0
        aStr += "nbStep:%d, distance : %d ,hauteur = %d"%( nbStep, distance, TableVerticalPos[indexAngle]);
        print (aStr)
        angle -= 1



def RayCastIntReworked ():

    angle=PosAngle+20-startAngle;

    for indexAngle in  range (startAngle,endAngle):
        # Vertical scan
        xx=PosX;
        yy=PosY;
        dx, dy = 0, 0
        # Launch a ray scanning...
        # ix=(CosTable[angle]>>1)   -64;
        # iy=(CosTable[(angle+64)%256]>>1)-64;
        ix=(CosTable[angle]>>1)   -64;
        iy=(CosTable[(angle+64)%256]>>1)-64;

        aStr = "indexAngle %d angle %d ix %d iy %d "%(indexAngle, angle, ix, iy)

        nbStep = 0;
        idx16 = (xx>>8) + ((yy>>8)<<4);
        labX, labY = (xx>>8) , (yy>>8)
        while (Labyrinthe[idx16] != 1):
            dx += ix
            dy += iy
            xx=PosX + (dx>>2)
            yy=PosY + (dy>>2)

            nbStep+=1
            idx16 = (xx>>8) + ((yy>>8)<<4)
            labX, labY = (xx>>8) , (yy>>8)
            # print (f"\tstep {nbStep} xx {xx} yy {yy} labX {labX} labY {labY}")
        if nbStep > 2:
            #div16b8_dividend = tab_Ci_int[indexAngle]
            distance = tab_Ci_int[indexAngle]//nbStep
            if (distance>100):
                TableVerticalPos[indexAngle]=0
            else:
                TableVerticalPos[indexAngle]=100-distance
        else:
            TableVerticalPos[indexAngle]=0
        aStr += "nbStep:%d, distance : %d ,hauteur = %d"%( nbStep, distance, TableVerticalPos[indexAngle]);
        print (aStr)
        angle -= 1

def RayCastIdeal ():
    angle=PosAngle+20-startAngle;

    for indexAngle in  range (startAngle,endAngle):

        angle_rad = angle * math.pi / 128

        xx=PosX;
        yy=PosY;
        ix = step*math.cos(angle_rad)
        iy = step*math.cos(angle_rad+(math.pi/2))
        nbStep = 0;
        idx16 = ((xx)>>8) + (((yy)>>8)<<4);
        while (Labyrinthe[idx16] != 1):
            nbStep+=1
            xx = round(PosX + nbStep*ix)
            yy = round(PosY + nbStep*iy)
            idx16 = ((xx)>>8) + (((yy)>>8)<<4);
            labX, labY = ((xx)>>8) , ((yy)>>8)
            # print (f"\tstep {nbStep} xx {xx} yy {yy} labX {labX} labY {labY}")
        if nbStep > 2:
            #div16b8_dividend = tab_Ci_int[indexAngle]
            distance = tab_Ci_int[indexAngle]//nbStep
            if (distance>100):
                TableVerticalPos[indexAngle]=0
            else:
                TableVerticalPos[indexAngle]=100-distance
        else:
            TableVerticalPos[indexAngle]=0
        # float_dist = (C - PosY)/math.sin(angle_rad)
        # nbStep = math.ceil(float_dist//step)
        print ("indexAngle " ,indexAngle, "angle ", angle, "ix ", round(ix), "iy ", round(iy),"nbStep = ", nbStep)

        angle -= 1

def main():

    print ("************* IDEAL **********")
    RayCastIdeal()
    # print ("************* FLOAT **********")
    # RayCastFloat()
    # print ("************* INTEGER **********")
    # RayCastInt ()
    print ("************* INTEGER REWORKED**********")
    RayCastIntReworked ()

if __name__ == '__main__':
    main()

