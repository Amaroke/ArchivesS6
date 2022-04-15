import random
import math
import statistics

sVN = 1111
sSTM = 100
sRANDU = 100


def vonNeuman(seed):
    r = seed * seed
    s = str(r)
    if(r > 9999):
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


def Runs(arr, nb):
    n_pos, n_neg, n, runs = 0, 0, 0, 0
    if len(arr)<2:
        return None
    arr_run = []
    mean = 2*n_pos*n_neg
    sd = ((mean-1)*(mean-2))
    prob = math.erfc(runs)
    pval = min(prob,1-prob) + random.random()
    return pval


def Exponentielle(x):
    return "non implémentée"


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


def exponentielle(lambdaVar):
    res = lambdaVar * math.exp(-lambdaVar)
    return res

### MAIN ###
testVisuel()
print("\nTests visuels chargés dans \"tests.txt\".")
print("\n---------- Tests Frequency : ----------")
testFrequency()
print("\n---------- Tests Runs : ----------")
testRuns()
print("\n")

fichier = open("test.txt", "w")
fichier.write("\nTests visuels chargés dans \"tests.txt\".\n")
res = []
for i in range(5):
    res.append(vonNeuman(50+50*i))
fichier.write(str(frequency(res, 32)))
fichier.write("\n")

res = []
for i in range(5):
    res.append(STM(50+50*i))
fichier.write(str(frequency(res, 32)))
fichier.write("\n")

res = []
for i in range(5):
    res.append(RANDU(50+50*i))
fichier.write(str(frequency(res, 32)))
fichier.write("\n")

res = []
for i in range(5):
    res.append(random.randrange(0, pow(2, 31)))
fichier.write(str(frequency(res, 32)))
fichier.write("\n")

res = []
for i in range(5):
    res.append(vonNeuman(50+50*i))
fichier.write(str(Runs(res, 32)))
fichier.write("\n")

res = []
for i in range(5):
    res.append(STM(50+50*i))
fichier.write(str(Runs(res, 32)))
fichier.write("\n")

res = []
for i in range(5):
    res.append(RANDU(50+50*i))
fichier.write(str(Runs(res, 32)))
fichier.write("\n")

res = []
for i in range(5):
    res.append(random.randrange(0, pow(2, 31)))
fichier.write(str(Runs(res, 32)))
fichier.write("\n")