
# control unit 

## State machine
<!-- 
* The state machine will be in the idle state till the **start logic is high**
* On start logic <= 1 (high) state machine will go to the next state ***fetch 1*** 
* The state machine will come to idle state when the conditions are met
*  -->

### States 
---

|State      | decimal   | binary    |   final decimal             |   
|-----------|-----------|-----------|-------                      |
|IDLE       |6d'0       |000_000    | 0                           |
|LDR1  1    |6d'5       |000_001    | 1024 + 10b(address in dec)  |
|LDR2  1    |6d'9       |000_010    | 2048 + 10b(address in dec)  |
|STAC  1    |6d'5       |000_011    | 3072 + 10b(address in dec)  |
|ADD        |6'd15      |000_100    | 4096                        |
|MUL        |6'd16      |000_101    | 5120                        |
### Registers
---
* AR - adress register
* IR - instruction register
* R  - general purpose register
* DR - data register 

### Control signals
---
* [1]  - add
* [2]  - mul
<!-- !for bus read -->
* [3]  - read_en (R1)
* [4]  - read_en (R2)  <!--??hardwired -->
* [5]  - read_en (AC)
* [6]  - read_en (IR)
* [7]  - read_en (AR)
* [8]  - read_en (PC) 
  <!-- !for bus write -->      
* [9]  - write_en (R1)
* [10] - write_en (R2)
* [11] - write_en (AC)
* [12] - write_en (IR)
* [13] - write_en (AR)
* [14] - write_en (PC)
* [15] - PC <= PC + 1
* [16] - data_mem_read
* [17] - data_mem_write
* [18] - inst_mem_read
* [19] - end_of_operation



|State      |Control Signal          |Decimal |
|---        |---                     |---     |
|IDLE       |0000-0000-0000-0000-0000|0       |     
|Fetch 1*   |0010-0001-0000-1100-0000|135328  |     
|Fetch 2*   |0010-0000-0000-0100-0000|131136  |     
|Fetch 3*   |0010-0000-1000-0100-0000|133152  |     
|Fetch 4*   |0010-0000-1000-0100-0000|133152  |
|Fetch 5*   |0010-0100-1000-0100-0000|18464   | 
|Fetch 6*   |0010-0000-1000-0100-0000|2080    |  
|CLAC       |0000-0000-0000-0000-0000|0       |     
|LDR1  1    |0000-1001-0000-0010-0000|36896   |     
|LDR1  2*   |0000-1000-0000-0000-0000|32768   |
|LDR1  3    |0000-1000-0001-0000-0000|33024   |
|LDR1  4    |0000-1000-0001-0000-0000|33024   |     
|LDR2  1    |0000-1001-0000-0010-0000|36896   |     
|LDR2  2*   |0000-1000-0000-0000-0000|32768   |
|LDR2  3    |0000-1000-0010-0000-0000|33280   |
|LDR2  4    |0000-1000-0010-0000-0000|33280   |     
|STAC  1*   |0000-0001-0000-0010-0000|4128    |     
|STAC  2    |0001-0000-0000-0101-0000|65616   |     
|STAC  3    |0001-0000-0000-0101-0000|65616   |     
|STAC  4    |0001-0000-0000-0101-0000|65616   |     
|ADD        |0000-0000-0100-0000-1101|1037    |     
|MUL        |0000-0000-0100-0000-1110|1038    |     
|EOF        |0100-0000-0000-0000-0000|262144  |

|Curent state        | Next state  | 
| -----------        | ----------- |
| Idle               | Fetch 1     |
| Paragraph          | Text        | -->
