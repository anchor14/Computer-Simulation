# Project 3
## Traffic simulation

Introduction
The project focuses on two different relationships. The first is the relationship between the average degree of a node(intersection) and the average time to destination in a bounded road system. The second is the relationship between the amount of traffic and the average time to destination in a bounded road system. We use the same road network for researching both relationships by providing different circumstances.

In the following write-up, we will discuss each part of our project separately to build up the understanding, the whole model, then the results.


Road Network
We have three different models of road network for our project, which build up on each one. The road network we use is based on a convex octagon that looks like <Figure 1>. This is the base model which is an octagon, with 8 nodes and 8 edges. In our project, the term ‘degree’, will mean the sum of the indegree and outdegree of a node. All the roads go in one direction, in a way that the they are all directed clockwise, and when a car starts at a random point on the road network, and keeps going forward, it will come back to where it was. In this case, it is trivial that a car will never be trapped in a loop, as before it makes the whole loop, the car must have reached the destination (which should be on our road system).
The second model is where four edges are added on top of the first model. Now the average degree of a node is two. The two horizontal nodes are directed in opposite directions and the two vertical nodes are directed in opposite ways likewise. This was done to prevent cars getting trapped in loops and never reaching the destination.
The third model is four edges added to the second model. The average degree of a node is three, and parallel edges are directed in opposite ways to prevent cars getting trapped in loops again. 
