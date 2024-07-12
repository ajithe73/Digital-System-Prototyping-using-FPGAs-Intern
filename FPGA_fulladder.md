Creating a full adder in Xilinx FVivado. Here’s a step-by-step tutorial to help you through the process:

 Step 1 Create a New Project in Vivado

1. Open Xilinx Vivado.
2. Click on **"Create New Project"**.
3. Name your project (e.g., `FullAdder`), choose a location, and click **Next**.
4. Select **RTL Project** and click **Next**.
5. Click **Add Sources** to add a new Verilog file. Click **Create File**, name it (e.g., `full_adder.v`), and click **OK**.
6. Add Constraints** for now. Click **Next**.
7. Select your FPGA board or the specific FPGA part you're using. Click **Next** and then **Finish**.
![image](https://github.com/user-attachments/assets/1090ebfd-8d13-4ae2-acc7-2ab689f88e3d)
                              6
 ![image](https://github.com/user-attachments/assets/14e0f29b-9e31-47fb-b6dc-ebecd6d86f22)
                            7                                                                                            7
![image](https://github.com/user-attachments/assets/5ca200ee-0822-4678-9e5f-ae710db47e3d)
                            8        
                               
           
                              7                                                               
                          
 Step 3: Write the Verilog Code for the Full Adder

1. In the Sources window, right-click on your Verilog file (`full_adder.v`) and select Open File
2. Enter the following Verilog code for a 1-bit full adder:

```verilog
module full_adder (
    input A,       // First input
    input B,       // Second input	
    input Cin,     // Carry input
    output Sum,    // Sum output
    output Cout    // Carry output
);

assign Sum = A ^ B ^ Cin;         // Sum calculation using XOR gates
assign Cout = (A & B) | (Cin & (A ^ B));  // Carry-out calculation

endmodule
```

### Step 4: Simulate the Full Adder

1. In the Flow Navigator pane, click on **Run Simulationand then Run Behavioral Simulation
2. Create a testbench to verify the functionality of your full adder:

```verilog
module tb_full_adder;

reg A, B, Cin;         // Inputs
wire Sum, Cout;        // Outputs

// Instantiate the full adder module
full_adder uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    // Initialize inputs
    A = 0; B = 0; Cin = 0;
    #10; A = 0; B = 0; Cin = 1;
    #10; A = 0; B = 1; Cin = 0;
    #10; A = 0; B = 1; Cin = 1;
    #10; A = 1; B = 0; Cin = 0;
    #10; A = 1; B = 0; Cin = 1;
    #10; A = 1; B = 1; Cin = 0;
    #10; A = 1; B = 1; Cin = 1;
    #10;
end

endmodule
```

3. Run the simulation and observe the results in the waveform

### Step 5: Synthesize and Implement the Design

1.	In the **Flow Navigator**, click on Run Synthesis
 ![image](https://github.com/user-attachments/assets/8745a2e0-a02b-4303-81b8-f8e320258a66)


2. After synthesis, click  open synthesis design
3 go to latout then IO PLANING SELECT THE PIN AS PER DATASHEET
 ![image](https://github.com/user-attachments/assets/cfb773b6-9d39-4ea1-a2c1-0f23010b801c)







2.	After synthesis, click on **Run Implementation
    ![image](https://github.com/user-attachments/assets/413530f6-da0e-489f-949d-c141c890e43c)

   ![image](https://github.com/user-attachments/assets/3f8525d9-e0fb-4214-82cf-58167d577278)

     


4. Once the implementation is complete, generate the bit stream by clicking on Generate Bit stream**.

 Step 6: Program the FPGA

1. Connect your FPGA board to your computer.
2. In Vivado, click on **Open Hardware Manager**.
3. Click on **Open Target** and then **Auto Connect**.
4. Program the device with the generated bitstream file by selecting **Program Device**.
