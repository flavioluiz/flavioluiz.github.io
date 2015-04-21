---
layout: page
title: Port-Hamiltonian Systems
---

Introduction
----------------------------
To be written!!

$$
\begin{align}
	\label{eq:ph_fin_dim1}
	\dot{x} = J(x) \nabla H(x) + B u, \\
	\label{eq:ph_fin_dim2}
	y = B^T \nabla H(x),
\end{align}
$$



Example: coupled structure dynamics + fluid dynamics
--------------------------------------------------------

All subsystems are coupled in the file `.\main\couplefullsystem.m`. Several tests
with the coupled system can be performed with `coupledFULL.m`. For a given tank FILLING ratio,
specifying the number of elements of each subsystem, this script finds the system natural frequencies.
It also plots the system modal shapes and presents the results of a simple simulation (where the
beam is initially deformed and released at initial time).

The following table shows the natural frequencies of the coupled system, considering the tank 25% filled:

Number of elements: | 10 | 50 | 200 | Ref. previous work
 --- | --- | --- | --- | --- | --- 
Slosh+bending | 0.4318 | 0.4332 | 0.4332  |  0.4362  
Slosh+bending | 1.1404 | 1.1436 | 1.1437  |  1.1938  
Slosh+bending | 1.3690 | 1.4174 | 1.4194  |  1.407   
Slosh+bending | 2.0544 | 2.2770 | 2.2860  |  2.1541  
Slosh+bending   | 2.5799 | 3.1637 | 3.1880  |  2.8618   
   | ... |  ... | ... |   
 1st Torsion  | 8.4273 | 8.4268 | 8.4267 | 9.3078  
 2nd bending  | 8.8955 | 8.7469 | 8.7515 | 9.7317

From the the eigenvectors of each mode, we can find the modal shape. The following animated GIFs
show the first 3 modal shapes (which represent coupled fluid+bending modes).
Each numerically obtained mode are also compared with the experimental
results obtained by exciting the system in the frequencies of these specific modes.
The tank is filling ratio is 75% for all following cases:

1st mode:

![First mode](https://github.com/flavioluiz/port-hamiltonian/raw/master/LHMNLC2015/results/mode1.gif)
![First mode video](https://github.com/flavioluiz/port-hamiltonian/raw/master/LHMNLC2015/results/video1.gif)

2nd mode:

![Second mode](https://github.com/flavioluiz/port-hamiltonian/raw/master/LHMNLC2015/results/mode2.gif)
![Second mode video](https://github.com/flavioluiz/port-hamiltonian/raw/master/LHMNLC2015/results/video2.gif)

3rd mode:

![Third mode](https://github.com/flavioluiz/port-hamiltonian/raw/master/LHMNLC2015/results/mode3.gif)
![Third mode video](https://github.com/flavioluiz/port-hamiltonian/raw/master/LHMNLC2015/results/video3.gif) 

*Remark:* Symmetric sloshing modes were neglected in the previous table. Due to their symmetry, 
they won't interact with structural dynamics (so they are not observable, neither controllable).
The following mode is an example of symmetric one:

![Symmetric mode](https://github.com/flavioluiz/port-hamiltonian/raw/master/LHMNLC2015/results/modesym.gif)

Finally, the code can be used for simulation. The following animated GIF shows an example
of simulation. The beam starts at a deformed condition and it is then released:

![Simulation](https://github.com/flavioluiz/port-hamiltonian/raw/master/LHMNLC2015/results/simulation.gif)