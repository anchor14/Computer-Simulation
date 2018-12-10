# Project2
## Epidemic within closed population

Our project is simulatoon of an epidemic using a color-grid. Our model will include births and deaths
of people. The color-grid will be something similar to the image on our cover page. The code that I
used to create that color grid is the following. The code that I used is simply using randomly
generated numbers to determine the ratio of different colors..

Model
Our model is based on the ‘SIR’ model with the addition of birth and death. So, we will have four different
categories which will be : [‘susceptible’, ‘infected’, ‘recovered’, ‘dead’]. The birth rate and death rate
inequality is shown below.
birth[‘susceptible’] = birth[‘recovered’] > birth[‘infected’]
death[‘susceptible’] = death[‘recovered’] < death[‘infected’]
So, ‘susceptible’ and ‘recovered’ people are considered equally when it comes to birth and death
rates. The reproduction number will be varied, so that we see how the results differs as we vary the
reproduction number. I am particularly interested in finding out the threshold reproduction number
to use to kill all the population.
