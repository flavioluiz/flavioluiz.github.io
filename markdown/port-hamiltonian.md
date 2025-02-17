# Port-Hamiltonian Systems

Port-Hamiltonian systems provide a powerful framework for modeling and control of complex physical systems. This framework has been one of my main research interests since my PhD, and I continue to explore its applications in various domains, particularly in aerospace engineering.

## Introduction

The port-Hamiltonian formulation unifies several fundamental concepts from mechanics, systems modeling, and control theory. It combines:
- Port-based modeling, enabling the representation of complex systems through the interconnection of simpler components
- Energy-based analysis, using energy as a common language across different physical domains (mechanical, electrical, thermal, etc.)
- Extension of classical Hamiltonian mechanics to open systems
- Natural framework for passivity-based control design

The framework is particularly valuable for:
1. Modeling multi-physics systems
2. Structure-preserving discretization of distributed parameter systems
3. Energy-based control design
4. Analysis of complex interconnected systems

## Mathematical Framework and Motivation

### Energy as a Unifying Concept

One of the main motivations for using port-Hamiltonian systems is their ability to describe complex physical systems through energy and power flow concepts. Every physical system can be characterized by:
- Energy storage (described by the Hamiltonian function)
- Energy dissipation (through damping or resistive elements)
- Power exchange with the environment (through ports)

This energy-based perspective provides:
1. A unified language for multi-physics systems
2. Natural preservation of physical properties
3. Clear insight into system stability
4. Systematic approaches for control design

### Basic Mathematical Structure

Let's consider a simple mass-spring system to illustrate the key concepts. The classical equation of motion is:

$$
\begin{align}
	m\ddot{x} + k x = F_{ext},
\end{align}
$$

With total energy:

$$
\begin{align}
	E = \frac{m \dot{x}^2}{2} + \frac{k x^2}{2},
\end{align}
$$

Using the momentum variable $p := m\dot{x}$, we can express this in port-Hamiltonian form:

$$
\begin{align}
	H(p,x) = \frac{p^2}{2 m} + \frac{k x^2}{2},
\end{align}
$$

Leading to Hamilton's equations:

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

### Power Flow and Interconnection

The port-Hamiltonian framework naturally describes power flow through the concept of power ports. Each port consists of two variables: an effort (e.g., force, voltage, pressure) and a flow (e.g., velocity, current, flow rate), whose product gives power.

For the mass-spring system above:
- The external force $F_{\text{ext}}$ (effort) and velocity $\dot{x}$ (flow) form a power port
- The power flow is given by $P = F_{\text{ext}}\dot{x}$
- The rate of change of energy satisfies $\dot{H} = F_{\text{ext}}\dot{x}$

This power-preserving property extends to interconnected systems, where:

$$\frac{dH}{dt} = P{\,}1 + P{\,}2 + \cdots + P{\,}n$$

where $P_i$ represents the power flow through each external port.

### Advantages for Control Design

The port-Hamiltonian framework offers several advantages for control design:
1. Energy-based stability analysis through Lyapunov functions
2. Passivity-based control methods
3. Natural handling of constraints and interconnections
4. Structure-preserving discretization for numerical implementation

## Applications in Aerospace Engineering

### PhD Research: Fluid-Structure Interaction
During my PhD at ISAE-SUPAERO (2013-2016), I developed port-Hamiltonian models for fluid-structure interaction, specifically studying a coupled system consisting of an aluminum plate with a tip tank partially filled with liquid. This work demonstrated the framework's capability to handle complex multi-physics systems while preserving important physical properties through discretization.

### Recent Developments
Since then, our research group has expanded the application of port-Hamiltonian systems to various aerospace problems, including:
- Power-preserving discretization methods for fluid-structure interaction
- Modeling and control of aircraft
- Spacecraft attitude control
- Piezoelectric actuator design
- Neural network-based surrogate modeling

## Selected Publications in Port-Hamiltonian Systems

Recent key contributions to the field include:

1. Fernandes, J. E. M., Cardoso-Ribeiro, F. L., & Morales, M. A. V. (2024). A port-Hamiltonian model of airplane longitudinal dynamics. *IFAC-PapersOnLine*, 58(6), 125-130.

2. Santos, V. B., Cardoso-Ribeiro, F. L., & Brugnoli, A. (2024). Surrogate Modeling of a Lumped-Mass Multibody Structure Using Hamiltonian Neural Networks. *IFAC-PapersOnLine*, 58(6), 48-53.

3. Cardoso-Ribeiro, F. L., Matignon, D., & Lefèvre, L. (2021). A Partitioned Finite Element Method for power-preserving discretization of open systems of conservation laws. *IMA Journal of Mathematical Control and Information*, 38(2), 493-533.

4. Brugnoli, A., Cardoso-Ribeiro, F. L., Haine, G., & Kotyczka, P. (2020). Partitioned finite element method for structured discretization with mixed boundary conditions. *IFAC-PapersOnLine*, 53(2), 7557-7562.

5. Aoues, S., Cardoso-Ribeiro, F. L., Matignon, D., & Alazard, D. (2017). Modeling and control of a rotating flexible spacecraft: A port-Hamiltonian approach. *IEEE Transactions on Control Systems Technology*, 27(1), 355-362.

6. Cardoso-Ribeiro, F. L., Matignon, D., & Pommier-Budinger, V. (2017). A port-Hamiltonian model of liquid sloshing in moving containers and application to a fluid-structure system. *Journal of Fluids and Structures*, 69, 402-427.

For more information about our ongoing research in this area, please check our latest publications on [Google Scholar](https://scholar.google.fr/citations?user=6gpZu9wAAAAJ).
