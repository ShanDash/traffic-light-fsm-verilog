# traffic-light-fsm-verilog
# Traffic Light Controller FSM in Verilog

## Overview
This project implements a **Finite State Machine (FSM)** based traffic light controller for a simplified 4-way intersection using Verilog HDL. The controller manages traffic lights for two directions: **North-South (NS)** and **East-West (EW)**, cycling through standard Red, Yellow, and Green phases.

---

## Features
- Finite State Machine design for sequential logic control
- Clear state transitions representing realistic traffic light sequences
- Separate control of NS and EW traffic lights
- Simple and modular Verilog RTL code
- Includes a testbench for simulation and verification
- Demonstrates fundamental digital design and verification concepts

---

## FSM States and Behavior

| State | NS Light | EW Light |
|-------|----------|----------|
| S0    | Green    | Red      |
| S1    | Yellow   | Red      |
| S2    | Red      | Green    |
| S3    | Red      | Yellow   |

- The FSM cycles through these states on each clock cycle (for simulation purposes).
- Output signals `ns_light` and `ew_light` encode the light colors as 2-bit values:
  - `00` = Red
  - `01` = Yellow
  - `10` = Green

---

## Files

| Filename                | Description                          |
|-------------------------|------------------------------------|
| `traffic_light_fsm.v`   | Verilog module implementing FSM    |
| `tb_traffic_light_fsm.v`| Testbench for simulation            |

---

## Example Output
Time=0  | NS Light=10 | EW Light=00
Time=10 | NS Light=01 | EW Light=00
Time=20 | NS Light=00 | EW Light=10
Time=30 | NS Light=00 | EW Light=01
...

