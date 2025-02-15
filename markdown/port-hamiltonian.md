---
layout: page
title: Port-Hamiltonian Systems
---

As part of my PhD research, I worked with modeling and control of systems using the port-Hamiltonian formulation. In this page, I give a little introduction about
the subject as well as show the first results obtained using this formulation for the
modeling of coupled fluid-structure system.

This research is part of [ANR HAMECMOPSYS](https://hamecmopsys.ens2m.fr/) project.


Introduction
----------------------------

The port-Hamiltonian systems formulation brings together several traditions from
mechanics, systems modeling and control.
One of them is the port-based modeling, where complex systems can be represented
by the interconnection of simpler blocks. While classical block diagrams and other signal-based
system interconnection have uni-directional information flow, port-based modeling uses
bi-directional energy ports between interconnected systems. In addition, by using
energy as a common language for interconnection, this approach allows modeling systems belonging to different
physical domains (mechanical, electrical, thermal, ...).
The graphical representation for this modeling concept is given by the so-called
[bond graphs](http://en.wikipedia.org/wiki/Bond_graph).

The formulation is also an extension of [Hamiltonian mechanics](http://en.wikipedia.org/wiki/Hamiltonian_mechanics), allowing the modeling
of open systems.

Finally, since port-Hamiltonian systems are a subclass of passive systems, they
become a natural starting point for passivity-based control design.

Simple example: Mass-spring
----------------------------

The well-know dynamic equation for the mass-spring is given by (from Newton's second law):

$$
\begin{align}
	m\ddot{x} + k x = F_{ext},
\end{align}
$$

The system total energy is given by the sum of kinetic and potential energy:

$$
\begin{align}
	E = \frac{m \dot{x}^2}{2} + \frac{k x^2}{2},
\end{align}
$$
by defining the moment variable:$$p := m\dot{x}$$, we can rewrite the energy as:

$$
\begin{align}
	H(p,x) = \frac{p^2}{2 m} + \frac{k x^2}{2},
\end{align}
$$
and the dynamic equations become the so-called Hamilton's equations:

<div class="matrix-equation">
$$
\begin{align}
\frac{d}{dt}\begin{vmatrix} p \\ x \end{vmatrix} &= 
\begin{vmatrix} 0 & -1 \\ 1 & 0 \end{vmatrix}
\begin{vmatrix} \frac{\partial H}{\partial p} \\ \frac{\partial H}{\partial x} \end{vmatrix} + 
\begin{vmatrix} 1 \\ 0 \end{vmatrix} F_{\text{ext}}
\end{align}
$$
</div>

If we compute the time rate of the Hamiltonian (energy flow):

$$
\begin{align}
	\frac{d H}{d t}(p,x) & = \frac{p}{m} \dot{p} + k x \dot{x}, \\
	 & = \dot{x} F_{ext}.
\end{align}
$$

Notice that if the external force is zero, then the system is conservative
(which is obviously the case for a mass-spring without damper).

In the port-Hamiltonian formulation, we define ports (like the force and
speed in this case), that can be used to interconnect with other systems.
By using power-conserving interconnections, the formulation allows to
model complex systems consistently. In addition, each subsystem can
come from different domains (thermal, mechanical, electro-magnetic,...).

A typical representation of port-Hamiltonian system is given by the following
equations:

$$
\begin{align}
	\dot{x} &= J(x) \nabla H(x) + B u, \\
	y &= B^T \nabla H(x),
\end{align}
$$

where J(x) is a skew-symmetric matrix, H(x) is the system Hamiltonian, x is
a state vector. If we compute the energy flow for this system:

$$
\begin{align}
	\frac{d H}{d t}(x) &= \nabla H(x)^T \dot{x}, \\
	&= \nabla H(x)^T J(x) \nabla H(x) + \nabla H(x)^T B u, \\
	&= y^T u.
\end{align}
$$

Systems that exhibit the previous energy flow are called passive systems. There are
several control techniques appropriate to these systems. In addition, the fact that
the port-Hamiltonian formulation naturally comes with an energy function (the Hamiltonian),
makes it a very convenient formulation for control using energy-shaping techniques, and
helps proving the system stability (by means of Lyapunov analysis).

Control motivation - damping assignment
-----------------------------------------

As a very simple example of control law. Suppose that we want to increase the damping of
some mechanical system that is given by the port-Hamiltonian equations presented before.
A simple 'u = - k y', with positive 'k', control law will lead to the following energy flow:

$$
\begin{align}
	\frac{d H}{d t}(x) & = - k y^T y \leq 0.
\end{align}
$$

Using this control law, we can guarantee that the system energy will be reduced. If the Hamiltonian
has a lower bound, it guarantees that the system is stable (better than that: it is stable regardless
of plant uncertainties!!).


Coupled structure + fluid dynamics
--------------------------------------------------------

The port-Hamiltonian formulation can also be extended to infinite-dimensional systems (PDEs), as
beam and fluid equations. Then, appropriate [discretization methodologies](https://www.researchgate.net/publication/222522902_Hamiltonian_discretization_of_boundary_control_systems)
can be used for obtaining a finite-dimensional approximation that guarantees that both the interconnection
structure and the passivity characteristics of the original system are conserved at the finite-dimensional level.

At ISAE, we have an experimental device that consists in an aluminium plate with a tip tank that can
be partially filled with liquid. We've used the port-Hamiltonian formulation to model this system
and compare it with experimental results.

The plate is modeled as a beam (with independent torsion and bending). The tank is modeled using
rigid mass/inertias. Finally, the fluid is modeled using Saint-Venant equations.
Each subsystem is coupled using a power conserving interconnection. Up to now, we've used
the global system for simulation. In the near future, we plan to use it for control design.

For a detailed description of the system, you can check the pre-print version of a [submitted paper](papers/FluidStructurePH.pdf) about the subject.
For detailed results as well as the source codes, you can check our [github page](https://github.com/flavioluiz/port-hamiltonian/tree/master/LHMNLC2015).

The following table shows the natural frequencies of the coupled system, considering the tank 25% filled:

| Number of elements: | 10 | 50 | 200 | Ref. [previous work](https://www.researchgate.net/publication/274896289_Control_design_for_a_coupled_fluid-structure_system_with_piezoelectric_actuators?ev=prf_pub) |
|-------------------|-----|-----|-----|-----|
| Slosh+bending | 0.4318 | 0.4332 | 0.4332 | 0.4362 |
| Slosh+bending | 1.1404 | 1.1436 | 1.1437 | 1.1938 |
| Slosh+bending | 1.3690 | 1.4174 | 1.4194 | 1.407 |
| Slosh+bending | 2.0544 | 2.2770 | 2.2860 | 2.1541 |
| Slosh+bending | 2.5799 | 3.1637 | 3.1880 | 2.8618 |
| ... | ... | ... | ... | ... |
| 1st Torsion | 8.4273 | 8.4268 | 8.4267 | 9.3078 |
| 2nd bending | 8.8955 | 8.7469 | 8.7515 | 9.7317 |

From the the eigenvectors of each mode, we can find the modal shape. The following animated GIFs
show the first 3 modal shapes (which represent coupled fluid+bending modes).
Each numerically obtained mode are also compared with the experimental
results obtained by exciting the system in the frequencies of these specific modes.
The tank filling ratio is 75% for all following cases:

1st mode:

![First mode](images/mode1.gif)
![First mode video](images/video1.gif)

2nd mode:

![Second mode](images/mode2.gif)
![Second mode video](images/video2.gif)

3rd mode:

![Third mode](images/mode3.gif)
![Third mode video](images/video3.gif)

*Remark:* Symmetric sloshing modes were neglected in the previous table. Due to their symmetry,
they won't interact with structural dynamics (so they are neither observable, nor controllable).
The following mode is an example of symmetric one:

![Symmetric mode](images/modesym.gif)

Finally, it is possible to simulate the system. The following animated GIF shows an example
of simulation. The beam starts from a deformed initial condition and it is then released:

![Simulation](images/simulation.gif)

More info
---------------------------------------
I and my advisor presented an introduction to Port Hamiltonian systems during a seminar at ISAE.
You can check the slides: [part I - Introduction](/presentations/DAEP/partI.pdf) and
[part II - Fluid-structure interactions](/presentations/DAEP/partII.pdf).
