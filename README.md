# FSMD-Fibonacci
Basic Finite State Machine with Datapath (FSMD) example to calculate the Fibonacci series up to the 12th index.

## Install

These examples use [ModelSim&reg; and Quartus&reg; Prime from Intel FPGA](http://fpgasoftware.intel.com/?edition=lite), [GIT](https://git-scm.com/download/win), [Visual Studio Code](https://code.visualstudio.com/download), make sure they are installed locally on your computer before proceeding.

## Usage

1. Grab a copy of this repository to your computer's local folder (i.e. C:\projects):

    ```sh
    $ cd projects
    $ git clone https://github.com/ihabadly/fsmd-fibonacci.git
    ```
2. Use Visual Studio Code (VSC) to edit and view the design files:

    ```sh
    $ cd fsmd-fibonacci
    $ code .
    ```
    Click on the fibo_toplevel.vhd file in the left pane to view its contents.
    
3. From the VSC View menu, choose Terminal, in the VCS Terminal, create a "work" library:

    ```sh
    $ vlib work
    ```
    
4. Compile all the design units:

    ```sh
    $ vcom *.vhd
    ```
    
5. Simulate your design. For example, if i = 12, then fib = 233:

    ```sh
    $ vsim work.fibo_toplevel_tb
    ```
