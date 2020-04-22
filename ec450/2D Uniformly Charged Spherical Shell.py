"""
Electric field of a hollow conducting sphere with uniform surface charge distribution

formula = Q/(4*pi*epsilon(not)r^2)
where r is the distance from the centrew of the sphere

"""

import numpy as np 
import matplotlib.pyplot as plt


#******************************CONSTANTS**********************************#
pi = 22/7
epsilonNot = 8.85418782 * (10**-12)
#*************************************************************************#


#******************************VARIABLES**********************************#
"""
radius = 0.1 # in meters
endPoint = 5.1 # in meters
charge = 10 # in Nano Columb
"""

radius = float(input("Enter the radius in meters: "))
endPoint = float(input("Enter the last point up to which you want the plot in meters: "))
charge = float(input("Enter the Charge in Nano Columb: "))
resolution = 1000
#*************************************************************************#

charge = charge * (10 ** -9)
x0 = np.linspace(0,radius,resolution,False)
len(x0)
y0 = np.zeros(resolution)
len(y0)
x = np.linspace(radius,endPoint,resolution)

numerator = charge
denominator = 4*pi*epsilonNot*(x**2)
y = numerator/denominator

y = np.concatenate((y0,y))
x = np.concatenate((x0,x))

plt.plot(x,y,'b')
plt.grid(b=1,which="both",axis='both')
plt.xlabel("Distance from the centre")
plt.ylabel("Magnitude of Electric Field in N/c")
plt.show()