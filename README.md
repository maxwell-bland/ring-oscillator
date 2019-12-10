Burning Down the House: Trojaning TRNGs with Reverse Fourier Transforms
=======================================================================

By the Blink Corporation

Goals for the Paper
-------------------

- Implement a ring oscillator
- Sample the ring oscillator in a predictable manner
- See if we can do it with two independent oscillators
- See if we can do it with forty
- Trojan predictable ring oscillator behavior at particular temperatures
- ???
- Profit!!!

Results (Intermediate)
----------------------

- Show that it is possible to trojan ring oscillator
  - Show that it is possible to control the phase of a ring oscillator in an FPGA
    - Delay, Number of Inverters, Temperature, [Voltage]
  - Show that it is possible to encode an arbitrary binary sequence as output from a controlled
    TRNG with some number of ring oscillators

Results (Final)
---------------
  - Pass DIEHARD and other randomness tests while maintaining the hardware trojan

[Base TRNG Implementation stolen from Wold, Tan, and emanuelen5!](https://github.com/emanuelen5/Wold_Tan_TRNG)

The Original Readme 
==================

# True Random Number Generator by Wold and Tang
True Random Number Generator for FPGA. Based on article by Wold and Tan [1].

## Navigating the repository
* `/`  
  contains the TRNG entity.
* `/simulation/`  
  contains a test bench for "stimulating" the TRNG and some .do-files for compiling the simulation files and displaying the waveforms nicely. The .do-macros are run in Modelsim by typing `do <filename.do>`.
* `/synthesis/`  
  contains a top for synthesizing the entity in an FPGA.

## Customizing
The degree of randomness is mainly controlled by the number of oscillator rings that are in parallel. There are other factors as well, which [1] explains very nicely.

[1] [Wold and Tan, "Analysis and Enhancement of Random Number Generator in FPGA Based on Oscillator Rings," International Journal of Reconfigurable Computing, Volume 2009](http://dx.doi.org/10.1155/2009/501672 "DOI link")
