# Algorithmic-Game-Theory-Programs
Two programs. One is a simulation of an online auction for advertising spaces, and the other is an abstract game between two players.

Question 2 is the abstract 2-player game, Question 4 is the auction simulation.

Sarmed Alwan
## Question 1


|       | A      | B      | C        | D        |
|-------|--------|--------|----------|----------|
|X      | 2      | 0      | 1        | 4        |
|Y      | 1      | 2      | 5        | 3        |
|Z      | 4      | 1      | 3        | 2        |

⦁	a)

|       | A      | B      |
|-------|--------|--------|
|X      | 2      | 0      |
|Y      | 1      | 2      |
|Z      | 4      | 1      |

|       | A      | B      |
|-------|--------|--------|
|Y      | 1      | 2      |
|Z      | 4      | 1      |

C and D are strictly dominated by B
X is then dominated by Z

⦁	b)


|       | A (a)      | B (1-a)    |
|-------|------------|------------|
|Y(x)	|1	     |2           |
|Z(1-x)	|4	     |1           |

There is no pure nash equilibrium, because if player Row chooses Y, then Column will choose A to minimise, but then Row will choose Z to maximise. Then Column will choose B to minimise, then Row will choose Y to maximise, then Column will choose A again to minimise, and this cycle will continue. There is no pure nash equilibrium because it is a zero-sum game and therefore their interests are directly opposed and won’t come to a rest where both players are satisfied.

⦁	c)

Column player strategy
EY:1a+2(1-a)=EZ:4a+1(1-a)
EY:1a+2-2a=EZ:3a
EY:2=EZ:4a
a=2/4
Play A with probability 1/2

Row player strategy
EA:1y+4(1-y)=EB:2y+1(1-y)
EA:3=EB:4y
y=3/4
Play Y with probability 3/4

Mixed equilibrium is:
Row player plays Y with probability 3/4 and Z with probability 1/4, and Column player plays A with probability 1/2 and B with probability 1/2.

## Question 2

Payoffs

|       | A      | B      | C      |
|-------|--------|--------|--------|
|X	|10, 5	 |0,6	  |0,0     |
|Y	|7,7	 |0,0	  |6,0     |
|Z	|0,0	 |7,7	  |5,10    |


Sums of payoffs

|       | A      | B      | C      |
|-------|--------|--------|--------|
|X	|15	 |6	  |0       |
|Y	|14	 |0	  |6       |
|Z	|0	 |14	  |15      |

Constraints
Recommendation PLAY X  (10Pxa+0Pxb+0Pxc)>=(7Pya+0Pyb+6Pyc)+(0Pza+7Pzb+5Pzc)
Recommendation PLAY Y  (7Pya+0Pyb+6Pyc)>=(10Pxa+0Pxb+0Pxc)+(0Pza+7Pzb+5Pzc)
Recommendation PLAY Z  (0Pza+7Pzb+5Pzc)>=(7Pya+0Pyb+6Pyc)+(10Pxa+0Pxb+0Pxc)
Recommendation PLAY A  (5Pxa+7Pya+0Pza)>=(6Pxb+0Pyb+7Pzb)+(0Pxc+0Pyc+10Pzc)
Recommendation PLAY B  (6Pxb+0Pyb+7Pzb)>=(5Pxa+7Pya+0Pza)+(0Pxc+0Pyc+10Pzc)
Recommendation PLAY C  (0Pxc+0Pyc+10Pzc)>=(6Pxb+0Pyb+7Pzb)+(5Pxa+7Pya+0Pza)
PLAY X Simplified: 3Pxa-7Pxb-11Pxc+0Pya+0Pba+0Pyc+0Pza+0Pzb+0Pzc>=0
PLAY Y Simplified: 0Pxa+0Pxb+0Pxc-3Pya-7Pba-1Pyc+0Pza+0Pzb+0Pzc>=0
PLAY Z Simplified: 0Pxa+0Pxb+0Pxc+0Pya+0Pb+0Pyc-17Pza+7PzbPzc>=0
PLAY A Simplified: -1Pxa+0xb+0xc+7Pya+0Pyb+0Pyc+17Pza+0Pzb+0Pzc>=0
PLAY B Simplified: 0Pxa+1Pxb+0Pxc+0Pya-7Pyb+0ya+0Pza-3Pzb+0Pzc>=0
PLAY C Simplified: 0Pxa+0Pxb-11Pxc+0Pya+0Pyb-7Pyc+0za+0Pzb+3Pzc>=0
Preparing for matlab A notation
3 -7 -11 0 0 0 0 0 0
0 0 0 -3 -7 -1 0 0 0
0 0 0 0 0 0 -17 -7 -1
-1 0 0 7 0 0 -17 0 0
0 1 0 0 -7 0 0 -3 0
0 0 -11 0 0 -7 0 0 3

With reversed signs (to maximise rather than minimise)
-3 7 11 0 0 0 0 0 0
0 0 0 3 7 -1 0 0 0
0 0 0 0 0 0 17 -7 1
1 0 0 -7 0 0 17 0 0
0 -1 0 0 7 0 0 3 0
0 0 11 0 0 7 0 0 -3

The solution is explained below
 

Entering the calculated values into Matlab’s linear programming function gives this result. It means that the maximum total of the two players’ utilities is 12.4545, and this is achieved by playing the following strategy:
Play X,A with probability 0.3182
Play X,B with probability 0.1364
Play Y,A with probability 0.0455
Play Y,C with probability 0.1364
Play Z,B with probability 0.0455
Play Z,C with probability 0.3182
These numbers add up to 1 (when not rounded), as they should, because they are probabilities for the recommendations to the players.
Question 3

## 3. a)

|Drivers on A	|Drivers on B	|Travel time for driver on A	|Travel time for driver on B|
|---|---|-----------|---------|
|0	|10	|10*0+40=40	|10*10=100|
|1	|9	|10*1+40=50	|10*9=90|
|2	|8	|10*2+40=60	|10*8=80|
|3	|7	|10*3+40=70	|10*7=70|
|4	|6	|10*4+40=80	|10*6=60|
|5	|5	|10*5+40=90	|10*5=50|
|6	|4	|10*6+40=100	|10*4=40|
|7	|3	|10*7+40=110	|10*3=30|
|8	|2	|10*8+40=120	|10*2=20|
|9	|1	|10*9+40=130	|10*1=10|
|10	|0	|10*10+40=140	|10*0=0|

Above are the 10 possible states of the As the amount of drivers on path A increases, the number of drivers on path B naturally decreases because they’ve moved over to path A. 10 drivers will start the ‘game’, and 10 drivers will also end it by ending up at the end node. If a driver participates in the game, they must leave the start node, travel via either route A or route B, and must then arrive at the end node.

The nash equilibrium outcome of this game is achieved where 3 drivers use route A and 7 drivers use route B. This is because if this is the condition of the game, no one will want to move from their current route to the other one. If a driver wanted to move from route B to route A, their travel time would go from 70 to 80, and if a driver wanted to move from route A to route B, their travel time would also go from 70 to 80. If a driver whose time is highlighted in light red moved to route A, the game conditions would change to the next row (A=4, B=6) and his time would increase to 80 (highlighted in darker red). If a driver whose time is highlighted in light blue moved from route A to route B, his time would increase to 80. Therefore, no one in this state wants to change.

2	8	10*2+40=60	10*8=80
3	7	10*3+40=70	10*7=70
4	6	10*4+40=80	10*6=60

Illustration of the nash equilibrium condition which produces the equilibrium outcome. The nash equilibrium outcome is that all drivers take 70 minutes to reach the end.

## 3. b)

|Drivers on A	|Drivers on B	|Travel time for driver on A (Minutes)	|Travel time for driver on B (Minutes)	|Total travel time for all drivers (Minutes)|
|---|---|-----------|---------|
|0	|10	|10*0+40=40	|10*10=100	|(40*0)+(100*10)=1000|
|1	|9	|10*1+40=50	|10*9=90	|(50*1)+(90*9)=860|
|2	|8	|10*2+40=60	|10*8=80	|(60*2)+(80*8)=760|
|3	|7	|10*3+40=70	|10*7=70	|(70*3)+(70*7)=700|
|4	|6	|10*4+40=80	|10*6=60	|(80*4)+(60*6)=680|
|5	|5	|10*5+40=90	|10*5=50	|(90*5)+(50*5)=700|
|6	|4	|10*6+40=100	|10*4=40	|(100*6)+(40*4)=760|
|7	|3	|10*7+40=110	|10*3=30	|(110*7)+(30*3)=860|
|8	|2	|10*8+40=120	|10*2=20	|(120*8)+(20*2)=1000|
|9	|1	|10*9+40=130	|10*1=10	|(130*9)+(10*1)=1180|
|10	|0	|10*10+40=140	|10*0=0	|(140*10)+(10*0)=1400|

The traffic pattern minimising total travel time for all drivers is having 4 drivers on route A and 6 drivers on route B. This is calculated by multiplying the travel time for a driver on each route in a given traffic pattern by the amount of drivers on that route in that same traffic pattern. For example, in the case where there are 5 drivers on route A and 5 on route B, we multiply the travel time for a driver on A, which is 90 in this traffic pattern, by the amount of drivers on route A. This will give us 90*5=450, which is the total travel time for all drivers on route A. Then we multiply the travel time for a driver on B, which is 50 in this traffic pattern, by the amount of drivers on B, which is 5. This gives us 50*5 which is 250, which is the total travel time for all drivers on route B. We then add 450 and 250, which will give us 700, which is the total travel time of all drivers in this traffic pattern. The traffic pattern with 4 drivers on A and 6 drivers on B gives us the lowest total travel time for all drivers, which is 680. The corresponding profile of commuting times is described in the table above.

## 3. c)
The price of anarchy of this game is 700-680=20. This is the difference between the total travel time of the equilibrium traffic pattern (3,7) and the total travel time of the optimal traffic pattern (4,6), optimal meaning that it has the lowest total travel time of all of the traffic patterns, and thus the best social welfare. The price of anarchy is the price of allowing everyone to choose for themselves (selfishly) compared to telling them what to do. If everyone is allowed to choose for themselves, they will eventually come to state (3,7), which is not optimal. If they are told to go with state (4,6) (4 drivers on A, 6 drivers on B) then the total travel time, and therefore the social welfare, is optimal. The Price of Anarchy of this game is 20, which is low. It is an increase over the optimal of only ~2.94% (20/680). This means that the worst nash equilibrium (the only one in this case) is only ~2.94% worse than the optimal solution.

## Question 4
 
The program iterates through 18,894,876 instances and finds 42,239 of them to be equilibria. The state with the best social welfare (the sum of all 3 players’ payoffs/utilities) has the following values: Click-through rates of 1, 1, 1, values of 1, 1, 1, and bids of 1, 1, 1. This means that the state with the best social welfare is one where everyone has a very high value for each click, and the click-through rates are all 1 (100%). This is an unrealistic scenario but it does make sense from a mathematical standpoint.
The equilibrium with the worst social welfare has a social welfare of 0.1700, and has the following values: Click-through rates of 0.3, 0.2, 0.1, values of 0.4, 0.2, 0.1, and bids of 0.3, 0.2, 0.1. Therefore, the highest Price of Anarchy is achieved by this equilibrium, because it has the lowest social welfare, and Price of Anarchy of a given instance is the social welfare of that instance over the optimal social welfare.
The Highest Price of Anarchy Ratio which can be achieved is 0.17/3 = 0.0567, i.e. 5.67%, because it is min(equilibriumutility)/max(utility).
