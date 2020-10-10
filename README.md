Burning Down the House: HDL Implementation of a TRNG Ring Oscillator
=======================================================================

By the Blink Corporation (code written via pair programming).

About this Repository
---------------------

This code:
- Implements a ring oscillator in VHDL.

By modifying the layout of the gates on an FPGA, you can see a modification 
to the oscillation. 

It may be an interesting project to se if you can bias the oscillations 
in a predictable manner, and thus have a "gateless" hardware trojan for
TRNGs.

`Trojaned_TRNG.vhd` contains the top-level definition for the trojaned ring oscillator.
