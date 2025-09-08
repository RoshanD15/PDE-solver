Numerical Simulation of Heat Diffusion and Wave Propagation

This project implements numerical solvers for the heat (diffusion) and wave equations in 2D and 3D using finite difference methods. It explores applications such as heat conduction in coaxial cables, material doping, and wave focusing with reflectors, combining algorithm design, numerical analysis, and visualization.

🔹 Features

Custom PDE Solver Functions

wave2d: simulates 2D wave propagation with argument checking, initialization, and iteration.

diffusion2d: models heat/material diffusion in 2D.

diffusion3d: extends diffusion solver to 3D systems.

Boundary Conditions

Supports Dirichlet (fixed value) and Neumann (insulated) boundary conditions.

Boundary functions are user-defined for flexible experimentation.

Case Studies

Heat conduction in a coaxial cable

Estimated thermal diffusivity κ needed to prevent insulation failure.

Material doping in a cylinder

Minimized diffusion time while keeping concentration error under 5%.

Wave reflection in a container

Modeled off-center disturbances and transient wave reflections.

3D wave focusing

Designed dome-shaped reflectors that achieved a peak amplitude of ~2.89.

Optimization & Validation

Iterative refinement of κ using while-loops and stability constraints.

Comparison of transient vs. steady-state solutions to validate models.

🔹 Tools & Skills

Programming: MATLAB (matrix operations, function handles, visualization)

Numerical Methods: finite differences, stability analysis, error metrics

Visualization: 2D/3D mesh plots, animations of wave propagation

Scientific Applications: diffusion, wave mechanics, thermal systems, boundary condition modeling

🔹 Example Results
Diffusion in a Cylinder

Concentration evolution during doping process (ensured <5% error).
(Insert figure or gif here once generated in MATLAB)

Heat Conduction in a Cable

Temperature distribution over time in coaxial insulation.

3D Wave Focusing

Dome reflector design concentrating wave intensity at the center (peak amplitude ~2.89).