import random
nbOne={}
for ii in range (64, 128):
    nbOne [str(ii)] = bin (ii).count("1")
print (nbOne)

print ("_nextPattern")
for ii in  range (0,64):
    print (" .byt ",0);

already_used_values = []

for ii in  range (64,128):
    possible_values = [int(v) for v in nbOne.keys() if nbOne[v] == bin (ii).count("1") and v not in already_used_values and int(v)!=ii]
    if len(possible_values) == 0:
        print (" .byt ",ii)
    else:
        randindex = random.randrange(len(possible_values))
        print (" .byt ",possible_values[randindex])
        already_used_values.append( str(possible_values[randindex]))

