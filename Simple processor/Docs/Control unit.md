
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
|IDLE       |6d'0       |000_000    |                             |
|Fetch 1    |6d'1       |000_001    |                             |
|Fetch 2    |6d'2       |000_010    |                             |
|Fetch 3    |6d'3       |000_011    ||
|CLAC       |6d'4       |000_100    | 1024|
|LDAC  1    |6d'5       |000_101    | 2048 + 10b(address in dec)|
|LDAC  2    |6d'6       |000_110    ||
|LDAC  3    |6d'7       |000_111    ||
|LDAC  4    |6d'8       |001_000    ||
|STAC  1    |6d'9       |001_001    | 3072 + 10b(address in decc)|
|STAC  2    |6d'10      |001_010    ||
|STAC  3    |6d'11      |001_011    ||
|STAC  4    |6d'12      |001_100    ||
|MVACR      |6d'13      |001_101    | 4096|
|MVRAC      |6d'14      |001_110    ||
|ADD        |6'd15      |001_111    | 6144|
|MUL        |6'd16      |010_000    | 7168|
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



|State      |Control Signal          |Decimal |
|---        |---                     |---     |
|IDLE       |0000-0000-0000-0000-0000|0       |     
|Fetch 1*   |0010-0001-0000-1100-0000|135328  |     
|Fetch 2*   |0010-0100-0000-0100-0000|147488  |     
|Fetch 3*   |0010-0000-1000-0100-0000|133152  |     
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
|STAC  2    |0001-0000-0000-0100-0000|65600   |     
|STAC  3    |0001-0000-0000-0100-0000|65600   |     
|STAC  4    |0001-0000-0000-0100-0000|65600   |     
|ADD        |0000-0000-0100-0000-1101|1037    |     
|MUL        |0000-0000-0100-0000-1110|1038    |     


|Curent state        | Next state  | 
| -----------        | ----------- |
| Idle               | Fetch 1     |
| Paragraph          | Text        | -->