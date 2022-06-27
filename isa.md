march
=====

This document describes Mathé's instruction set architecture: _march_. It adopts
the Von Neumann execution model: there is an instruction pointer (IP) register
holding the value of the currently executing instruction. Instructions are
stored in memory and executed one by one.
Additionally march has 16 general purpose registers: `$r0`, `$r1`, ..., `$r31`.
All registers, including the IP, are 32 bits wide.

| instruction | description        | type         | encoding                |
|-------------|--------------------|--------------|-------------------------|
| `add`       | addition           | arithmetic   | `0000 $src1 $src2 $dst` |
| `sub`       | subtraction        | arithmetic   | `0001 $src1 $src2 $dst` |
| `mul`       | multiplication     | arithmetic   | `0010 $src1 $src2 $dst` |
| `div`       | division           | arithmetic   | `0001 $src1 $src2 $dst` |
| `shft`      | bit shift          | arithmetic   | `0100 $src $shft $dst`  |
| `and`       | bitwise and        | arithmetic   | `0101 $src $dst`        |
| `or`        | bitwise or         | arithmetic   | `0110 $src $dst`        |
| `not`       | bitwise not        | arithmetic   | `0101 $src $dst`        |
| `jump`      | conditionally jump | control flow | `1000 0nzp $dep $addr`  |
| `int`       | interrupt          | control flow | `1001 0000 0000 $code`  |
| `ld`        | load from memory   | memory       | `1010 #mask $addr $dst` |
| `st`        | store to memory    | memory       | `1011 #mask $src $addr` |
| `loc`       | locate code        | locate       | `1100 0000 0000 $dst`   |
|             | reserved           |              | `1101 ...`              |
|             | reserved           |              | `1110 ...`              |
| `sys`       | system control     | system       | `1111 ...`              |

For `jump`, the bits `n`, `z`, and `p` respectively determine whether or not to
jump in the cases `$dep < 0`, `$dep = 0`, and `$dep > 0`.

The `loc` instruction writes the address of itself (i.e. the instruction pointer)
to register `$dst`.

System control includes interrupt control (lidt, sti, cli, iret), context
switching, system information servicing (time), and paging control.
