from scipy import stats
import numpy
import math

step = 1.8
centers = numpy.arange(-5.1, 5.71, step)
mi = [1, 2, 19, 60, 17, 0, 1]
V = sum(mi)
pi = []
for i in mi:
    pi.append(i / V)
M = 0 # Матожидание
for i in range(centers.size):
    M = M + centers[i] * pi[i]
D = 0 # Дисперсия
for i in range(centers.size):
    D = D + ((centers[i] - M) ** 2) * pi[i]
n = (2*D)/(D-1) # Число степеней свободы
theorP = []
for i in range(centers.size):
    theorP.append(stats.t.cdf(centers[i] + step/2, n) - stats.t.cdf(centers[i] - step/2, n))
theorNums = []
for i in theorP:
    theorNums.append(i * V)
U = stats.chisquare(mi, theorNums, 2)
print(U[0])
