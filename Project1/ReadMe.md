# Project 1

### Object collision simulation in solar system


This project focuses on the disruption of the solar system from a bypassing object (Solar system consisting of the
Sun, and all the planets disregarding Pluto), with the according mass, position, and velocity.
The interest that led to the foundation of this project begins with the Solar Disruption Theory. The theory is about
the formation of our Solar System. The Sun and an object collided in space, which led to the creation of our solar
system. This caused a disturbance in space which caused some parts of the Sun to burst. The torn pieces from the
Sun became the planets we have today. This led to the question of whether or not there is a possibility of another
object falling and colliding into the solar system would create the same effect.

In our code, the bypassing object mass is a user input. When you run the file on
Matlab, a dialogue box will pop up. You have to input an integer, and the object
mass will be 10^28*(the integer you put in). There are 4 subplots. First one is 2D,
second one is 2D zoomed; third one is 3D, and the last one is 3D zoomed.
The rr variable in the code is what determines the chances of a collision. If you
want (more) collision, increase the rr value, if you want less or no collision, do
vice versa. The rr is set over the threshold by default, so that the collisions do
happen. If you want to see the non-collision version, make it smaller by
multiplying 0.1.
The mass and velocity determines the magnitude of disruption.
