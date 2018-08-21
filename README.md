# RBFPD_desgin
This project can automatically optimize the shape of RBFPD.

## Software used
* MATLAB
* SolidWorks 2017
* Hypermesh 13.0
* ABAQUS 6.14-2

## Main process
  The automated optimization process was as follows. First, the retainer’s shape was created using the software SolidWorks. Second, the software Hypermesh was used to generate high quality meshes, to apply a distributed load was applied to the pontic of the RBFPD, and to assign fixed boundary condition to both sides of the cuboid. Third, the finite element model was solved using the software ABAQUS for stresses at the interface between the RBFPD and central incisor. Finally, the values of tensile stress and shear stress at the interface between retainer and prepared tooth were examined. The area with stresses higher than the preset of adhesive’s bonding strengths was summed up as the total debonding area. The particle swarm optimization(PSO) algorithm was implemented to minimize the total debonding area and to generate new design variables for retainer’s shape. The complete process was shown below.
![](Figure/Automated_optimization_process.PNG)
---
