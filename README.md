# Little Computer

Based on the Hack Computer from the [From Nand to Tetris Course](https://www.nand2tetris.org/).

## Project Structure

```
|   # Files with the code for different modules of the computer
|__ ElementaryLogicGates
|__ Arithmetic.v
|   .
|   .
|   .
|
|   # Test benches for the modules
|__ LogicGatesTestBenches
    |__ and_tb.v
    |__ and16_tb.v
    |__ dmux_tb.v
    |   .
    |   .
    |   .
    |   # Output of test benches
    |__ DumpFiles
        |__ and_dump.vcd
        |__ and16_dump.vcd
        |__ dmux_dump.vcd
        |   .
        |   .
        |   .
|__ ArithmeticTestBenches
|   .
|   .
|   .
```

## How to run this project

### Requirements

1. A Verilog compiler. I am using icarus-verilog.
2. Something to visualize the output of the test benches. I am using GTKWave.

### Steps

1. Open a terminal in a Test Bench folder and compile of of the test benches.

```
cd ArithmeticTestBenches
iverilog ./and_tb.v
```

2. This will create an `a.out` file. Run this file using

```
vvp a.out
```

3. This will print the output of the test bench to the terminal. You can view this in wave form using GTKWave.
