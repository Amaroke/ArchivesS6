import random
import math
import statistics

sVN = 1111
sSTM = 100
sRANDU = 100


def vonNeuman(seed):
    r = seed * seed
    if(r >= 0 & r <= 9999):
        s = str(r)
        while(len(s) >= 5):
            s = s[1:len(s)-1]
        return int(s)


def STM(seed):
    a = 16807
    return (a * seed) % pow(2, 31)-1


def RANDU(seed):
    a = 65539
    return (a * seed) % pow(2, 31)


def vonNeuman1000():
    res = []
    res.append(vonNeuman(sVN))
    for i in range(999):
        res.append(vonNeuman(res[i]))
    return res


def STM1000():
    res = []
    res.append(STM(sSTM))
    for i in range(999):
        res.append(STM(res[i]))
    return res


def RANDU1000():
    res = []
    res.append(RANDU(sRANDU))
    for i in range(999):
        res.append(RANDU(res[i]))
    return res


def Random1000():
    res = []
    res.append(random.randrange(0, pow(2, 31)))
    for i in range(999):
        res.append(random.randrange(0, pow(2, 31)))
    return res


def testFrequencyVonNeuman():
    res = []
    for i in range(10):
        res.append(vonNeuman(50+50*i))
        for j in range(99):
            res.append(vonNeuman(res[j+i*100]))
    return frequency(res, 32)


def testFrequencySTM():
    res = []
    for i in range(10):
        res.append(STM(50+50*i))
        for j in range(99):
            res.append(STM(res[j+i*100]))
    return frequency(res, 32)


def testFrequencyRandu():
    res = []
    for i in range(10):
        res.append(RANDU(50+50*i))
        for j in range(99):
            res.append(RANDU(res[j+i*100]))
    return frequency(res, 32)


def testFrequencyRandom():
    res = []
    for i in range(10):
        res.append(random.randrange(0, pow(2, 31)))
        for j in range(99):
            res.append(random.randrange(0, pow(2, 31)))
    return frequency(res, 32)


def frequency(x, nb):
    cpt = 0
    for i in x:
        for char in format(i, "b").zfill(nb-1):
            if char == '0':
                cpt -= 1
            else:
                cpt += 1
    sobs = abs(cpt) / math.sqrt((nb-1)*len(x))
    p_val = math.erfc(sobs / math.sqrt(2))
    return p_val


def testRunsVonNeuman():
    res = []
    for i in range(10):
        res.append(vonNeuman(50+50*i))
        for j in range(99):
            res.append(STM(res[j+i*100]))
    return Runs(res, 32)


def testRunsSTM():
    res = []
    for i in range(10):
        res.append(STM(50+50*i))
        for j in range(99):
            res.append(STM(res[j+i*100]))
    return Runs(res, 32)


def testRunsRandu():
    res = []
    for i in range(10):
        res.append(RANDU(50+50*i))
        for j in range(99):
            res.append(RANDU(res[j+i*100]))
    return Runs(res, 32)


def testRunsRandom():
    res = []
    for i in range(10):
        res.append(random.randrange(0, pow(2, 31)))
        for j in range(99):
            res.append(random.randrange(0, pow(2, 31)))
    return Runs(res, 32)


def Runs(x, nb):
    return "Non implémentée"


def testVisuel():
    fichier = open("tests.txt", "w")
    list = vonNeuman1000()
    list += Random1000()
    list += RANDU1000()
    list += Random1000()
    for e in list:
        fichier.write(str(e)+"\n")
    fichier.close()


def testFrequency():
    print("VonNeuman : " + str(testFrequencyVonNeuman()))
    print("STM : " + str(testFrequencySTM()))
    print("RANDU : " + str(testFrequencyRandu()))
    print("Random : " + str(testFrequencyRandom()))


def testRuns():
    print("VonNeuman : " + str(testRunsVonNeuman()))
    print("STM : " + str(testRunsSTM()))
    print("RANDU : " + str(testRunsRandu()))
    print("Random : " + str(testRunsRandom()))


### MAIN ###
testVisuel()
print("\nTests visuels chargés dans \"test.txt\".")
print("\n---------- Tests Frequency : ----------")
testFrequency()
print("\n---------- Tests Runs : ----------")
testRuns()
print("\n")
