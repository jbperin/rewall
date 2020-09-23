
print ("_TableMul10Low")
for ii in  range (0,200):
    print (" .byt ",(ii*10)&255);

print ("_TableMul10High")
for ii in  range (1,200):
    print (" .byt ",((ii*10)&0xFF00)>>8);
