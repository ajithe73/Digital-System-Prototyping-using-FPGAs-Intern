# Digital-System-Prototyping-using-FPGAs-Intern-Documentaion-Repo
[link for learning verilog](https://www.chipverify.com/verilog/verilog-tutorial)
## Introduction 

Repository documenting the Summer Internship’24 on Digital System Prototyping using FPGAs (NIELIT Calicut)
![image](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/143102635/ddeb2a02-2344-46c1-86b7-a55d79f40aba)<br>
![e](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/143102635/b0084d1d-4bed-4e68-8e09-fcfc0dd5c110)

Our key focus is on the System specification ,Architectural design ,Functional design and logic design ,and finaly the circuit design <br>

![image](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/143102635/33154139-4ee6-4524-8f3e-11037ca2ca3a)<br>

The Gajski-Kuhn Y-chart is a model, which captures the considerations in designing semiconductor devices.

The three domains of the Gajski-Kuhn Y-chart are on radial axes. Each of the domains can be divided into levels of abstraction, using concentric rings.

At the top level (outer ring), we consider the architecture of the chip; at the lower levels (inner rings), we successively refine the design into finer detailed implementation −

Creating a structural description from a behavioral one is achieved through the processes of high-level synthesis or logical synthesis.

Creating a physical description from a structural one is achieved through layout synthesis.<br>

## Synthesis vs Compilation

### Compilation
The RTL files and the testbench files are text files that need to be analyzed before you can even think about simulation. A tool called a parser will read every HDL file and check that the syntax is correct. Every language has a LRM, a (language reference manual) that defines the syntax that is valid. Several HDL languages have different versions, hence different LRM requirements. The compiler is in fact a parser that checks every HDL file for syntax errors. It will report warnings and errors related to the code you have written. All files, RTL and behavoural need to be syntactically correct before you can go to the next step, elaboration.

### Synthesis
Synthesis is the process of converting RTL code, typically written in hardware description languages like Verilog or VHDL, into a gate-level netlist. It involves mapping the functionality specified in the RTL code to a library of standard cells, such as NAND, NOR, XOR gates, etc., provided by the target technology.

Things that we need for the synthesis.....
RTL Code,Technology Libraries,Constraint Files

The need to use GLS (Gate level simulation)<br>
The term "gate level" refers to the netlist view of a circuit, usually produced by logic synthesis. So while RTL simulation is pre-synthesis, GLS is post-synthesis. The netlist view is a complete connection list consisting of gates and IP models with full functional and timing behavior. RTL simulation is a zero delay environment and events generally occur on the active clock edge. GLS can be zero delay also, but is more often used in unit delay or full timing mode. Events may be triggered by the clock, but will propagate according to the delays on each element. The loading and wiring delay models of the netlist can be estimated by the synthesis tools, or can be output from the layout tools. These delay models usually come in the form of an SDF (standard delay format) file.

![image](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/143102635/1f8d60b8-5ebb-4161-8cc6-b603661904f9)

![image](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/143102635/9088652b-5f25-46db-86b2-2eba0dac05a9)

![image](https://github.com/ARX-0/Digital-System-Prototyping-using-FPGAs-Intern/assets/143102635/0f476501-d1b3-4e96-b792-c7f5a8b38e09)

#### Software used :- QuestaSim,ModelSim

#### Books for reference:-
"Douglas A. Pucknell" - Douglas A. Pucknell <br>
"CMOS Digital IC Circuit analysis and Design"-MC GRAW hill <br>
"Digital integrated circuit design from vlsi architectures to cmos fabrication" - Hubert Kaeslin

### the rough work for today 

writing syntehesizeable code in verilog that actually work 

schematic has 6000 pages maximum so we go for

IP means Intelectual Protocols it is the base for REUSABILITY 

Bottom-up (bricks n to a building) and top down (reverse) approach ....

Lesser TTM (time to market) is what you will see in the market :)
behaviorial codes we do use reg type not net and wire WHY?
BLOCKING AND NON BLOCKING STATEMETS IN VERILOG 

(changing a value in either one of the inputs causes a EVENT -> leads to another event) hardware is CONCURRENT 

Single kernel architecture is better ahm just verilog file no intermidiate files time consumed is vv less :) 
double kernel arch 


you cant tapeout opensource hardware ? damn .....  primetime and caliber 

get the tool list of the companies and compile them :) 

with a single cond statement y = sel ? a:b;

8x8 64 bit memory 
reg [0:63] mem [0:7][0:7]
how to acess and find the very first bit of the very last 7 of 7 th place in the mem register 

difference between $ display nd $ monitor 
display is only for 1 event 
monitor is used for every single EVENT :)

[1](https://www.geeksforgeeks.org/left-shift-right-shift-operators-c-cpp/)<br>

[2](https://chipedge.com/everything-you-need-to-know-about-synthesis-in-vlsi/#:~:text=Synthesis%20in%20VLSI%20is%20the,into%20a%20properly%20implemented%20chip.)<br>
[3](
https://www.google.com/search?q=ieee+standards+for+verilog+2005+and+2006&rlz=1C1JJTC_enIN1033IN1035&oq=ieee+standards+for+verilog+2005+and+2006+&gs_lcrp=EgZjaHJvbWUyBggAEEUYOTIJCAEQIRgKGKABMgkIAhAhGAoYoAHSAQkxMTk2NWowajmoAgCwAgE&sourceid=chrome&ie=UTF-8)<br>
[4](
https://www.google.com/search?gs_ssp=eJzj4tLP1TcwS8mtTDI0YPRSLEstyszJT1dIzEtRKK4sLknNhYmk55ckZyQWAwB31xDQ&q=verilog+and+systemverilog+gotchas&rlz=1C1JJTC_enIN1033IN1035&oq=verilog+and+system+verilog+g&gs_lcrp=EgZjaHJvbWUqCQgBEC4YChiABDIGCAAQRRg5MgkIARAuGAoYgAQyCQgCEAAYChiABDINCAMQABiGAxiABBiKBTINCAQQABiGAxiABBiKBTINCAUQABiGAxiABBiKBTINCAYQABiGAxiABBiKBTINCAcQABiGAxiABBiKBTIKCAgQABiABBiiBNIBCDgwMDZqMGo3qAIIsAIB&sourceid=chrome&ie=UTF-8
)
<br>
[5](https://web.engr.oregonstate.edu/~traylor/ece474/beamer_lectures/verilog_number_literals.pdf)<br>

[6](https://www.geeksforgeeks.org/little-and-big-endian-mystery/)
