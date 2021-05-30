
# Workflow

## State machine
<!-- 
* The state machine will be in the idle state till the **start logic is high**
* On start logic <= 1 (high) state machine will go to the next state ***fetch 1*** 
* The state machine will come to idle state when the conditions are met
*  -->

### States 
---

|State      | decimal   | binary    |   
|-----------|-----------|-----------|
|IDLE       |6d'0       |000_000    |
|Fetch 1    |6d'1       |000_001    |
|Fetch 2    |6d'2       |000_010    |
|Fetch 3    |6d'3       |000_011    |
|CLAC       |6d'4       |000_100    |
|LDAC  1    |6d'5       |000_101    |
|LDAC  2    |6d'6       |000_110    |
|LDAC  3    |6d'7       |000_111    |
|STAC  1    |6d'8       |001_000    |
|STAC  2    |6d'9       |001_001    |
|STAC  3    |6d'10      |001_010    |
|MVACR      |6d'11      |001_011    |
|MVRAC      |6d'12      |001_100    |
|ADD        |6d'13      |001_101    |
|MUL        |6d'14      |001_110    |

### Registers
---
* AR - adress register
* IR - instruction register
* R  - general purpose register
* DR - data register 


### Control signals
---
* [1]  - branch signal 
* [2]  - PC <= PC + 1
* [3]  - bus_read (reg)
* [4]  - bus_read (ar) ?? <!-- hardwired -->
* [5]  - bus_read (dr)
* [6]  - bus_read (ac)
* [7]  - bus_read (pc)
* [8]  - bus_read (ir) ?? <!-- hardwired -->
* [9]  - bus_read 
* [10] - add
* [11] - mul
* [12] - memory_read_instruction
* [13] - memory_read_data
* [14] - memory_write
* [15] - AC <= 0
* [16] - 

|State      |                       |
|           |                       |
|IDLE       |0 0 0 0 0 0 0 000000000|     
|Fetch 1    |0 0 0 0 1 0 0 001000000|     
|Fetch 2    |0 0 0 0 0 0 0 000000010|     
|Fetch 3    |0 0 0 0 0 0 0 000000001|     
|CLAC       |0 1 0 0 0 0 0 000000000|     
|LDAC  1    |0 0 0 1 0 0 0 001000000|     
|LDAC  2    |0 0 0 0 0 0 0 000000010|     
|LDAC  3    |0 0 0 0 0 0 0 000000000|     
|LDAC  4    |0 0 0 0 0 0 0 000010000|     
|STAC  1    |0 0 0 0 0 0 0 001000000|     
|STAC  2    |0 0 1 0 0 0 0 000100010|     
|STAC  3    |0 0 0 0 0 0 0 000010000|     
|STAC  4    |0 0 0 0 0 0 0 000000000|     
|MVACR      |0 0 0 0 0 0 0 000100000|     
|MVRAC      |0 0 0 0 0 0 0 000000100|     
|ADD        |0 0 0 0 0 0 1 000100100|     
|MUL        |0 0 0 0 0 1 0 000100100|     


|Curent state        | Next state  | 
| -----------        | ----------- |
| Idle               | Fetch 1     |
| Paragraph          | Text        | -->