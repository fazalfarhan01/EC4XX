"""
Electric field of a sphere with uniform volume charge distribution

formula for radius of gaussian surface (r) less than the radius of sphere (a) $$$ r < a $$$
E = (volumeCharge * r)/(3*epsilonNot)

formula for radius of gaussian surface (r) greater than the radius for sphere (a) $$$ r > a $$$ 
E = (volumeCharge * a**3)/(3*epsilonNot*r**2)

formula for Electric field due to uniform line charge is given by
E = lineCharge/2*pi*epsilonNot * r where r is the distance from the line charge.



where r is the distance from the centrew of the sphere

"""
#******************************LIBRARIES**********************************#
import numpy as np 
import matplotlib.pyplot as plt
#*************************************************************************#


#******************************CONSTANTS**********************************#
pi = 22/7
epsilonNot = 8.85418782 * (10**-12)
#*************************************************************************#


#******************************VARIABLES**********************************#
endPoint = 5.1 # in meters
LineCharge = 10 # in Micro Columb/meter
resolution = 1000

endPoint = float(input("Enter the last point up to which you want the plot in meters: "))
LineCharge = float(input("Enter the Line Charge in Micro Columb/meter: "))

#*************************************************************************#

LineCharge = LineCharge * (10 ** -6)

x = np.linspace(0,endPoint,5*resolution)

numerator = LineCharge
denominator = 2*pi*epsilonNot*x
y = numerator/denominator


plt.plot(x,y,'r')
plt.grid(b=1,which="both",axis='both')
plt.xlabel("Distance from line charge in meters")
plt.ylabel("Magnitude on Electric Field in N/c")
plt.show()
