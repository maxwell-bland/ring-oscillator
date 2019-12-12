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

Repository Organization
-----------------------

`Trojaned_TRNG.vhd` contains the top-level definition for the trojaned ring oscillator.
