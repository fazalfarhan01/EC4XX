"""
Electric field of a sphere with uniform volume charge distribution

formula for radius of gaussian surface (r) less than the radius of sphere (a) $$$ r < a $$$
E = (volume_charge * r)/(3*epsilonNot)

formula for radius of gaussian surface (r) greater than the radius for sphere (a) $$$ r > a $$$ 
E = (volume_charge * a**3)/(3*epsilonNot*r**2)

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
radius = 0.1 # in meters
endPoint = 5.1 # in meters
VolumeCharge = 10 # in Micro Columb
resolution = 1000

radius = float(input("Enter the radius of sphere in meters: "))
endPoint = float(input("Enter the last point up to which you want the plot in meters: "))
volumeCharge = float(input("Enter the Volume Charge in Micro Columb/meter^3: "))

#*************************************************************************#

volumeCharge = volumeCharge * (10 ** -6)
x0 = np.linspace(0,radius,resolution,False)

y0 = (VolumeCharge * x0)/(3*epsilonNot)


x = np.linspace(radius,endPoint,resolution)

numerator = VolumeCharge * radius**3
denominator = 3*epsilonNot*(x**2)
y = numerator/denominator

y = np.concatenate((y0,y))
x = np.concatenate((x0,x))

plt.plot(x,y,'r')
plt.grid(b=1,which="both",axis='both')
plt.xlabel("Distance from the centre in meters")
plt.ylabel("Electric field strength in N/c")
plt.show()