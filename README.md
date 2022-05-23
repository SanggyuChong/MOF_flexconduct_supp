
This repository contains the optimized structural files of M(NDIDP) MOFs at all volumes considered, DFT-derived force field parameters of M(NDIDP), and inputs for QuickFF, Yaff, and VASP calculations from the study titled "Tunable Electrical Conductivity of Flexible Metal–Organic Frameworks" by Chong, Rogge, and Kim (2022), published in Chemistry of Materials: [10.1021/acs.chemmater.1c03236](https://doi.org/10.1021/acs.chemmater.1c03236).

## optimized_structures
This directory contains the optimized `CONTCAR` files of the M(NDIDP) MOFs at the volume points considered.

## QuickFF_calculation_inputs
This directory contains the input script that have been used for covalent parameter generation using [QuickFF](http://molmod.github.io/QuickFF/).

## VASP_calculation_inputs
This directory contains VASP INCAR files for the different calcualtions conducted for the study: geometry optimization, Hessian matrix calculation, HSE06-D3 level band structure calculation. Tutorial for HSE06 band structure calculation is found [here](https://www.vasp.at/wiki/index.php/Si_HSE_bandstructure#Procedure_2:_0-weight_.28Fake.29_SC_procedure_.28works_DFT_.26_hybrid_functionals.29) and [here](https://www.vasp.at/forum/viewtopic.php?f=4&t=6633&sid=3246e1e022bfd68f1453146647b05938&start=15).

## YAFF_calculation_inputs
This directory contains the derived force field paramters from QuickFF for each M(NDIDP) MOF and also the input scripts for YAFF MD calculations. Note that configurations at different volumes for the NVsT ensemble simulations were extracted from an initial, NPT ensemble simulation.



