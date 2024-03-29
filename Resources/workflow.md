
# Workflow

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
|IDLE       |6d'0       |000_000    | 0                            |
|Fetch 1    |6d'1       |000_001    |                             |
|Fetch 2    |6d'2       |000_010    |                             |
|Fetch 3    |6d'3       |000_011    |                             |
|CLAC       |6d'4       |000_100    | 1024                        |
|LDAC  1    |6d'5       |000_101    | 2048 + 10b(address in dec)  |
|LDAC  2    |6d'6       |000_110    |                             |
|LDAC  3    |6d'7       |000_111    |                             |
|LDAC  4    |6d'8       |001_000    |                             |
|STAC  1    |6d'9       |001_001    | 3072 + 10b(address in decc) |
|STAC  2    |6d'10      |001_010    |                             |
|STAC  3    |6d'11      |001_011    |                             |
|STAC  4    |6d'12      |001_100    |                             |
|ADD        |6'd15      |001_111    | 6144                        |
|MUL        |6'd16      |010_000    | 7168                        |
### Registers
---
* AR - adress register
* IR - instruction register
* R  - general purpose register
* DR - data register 


### Control signals
---96
* [1]  - branch signal 
* [2]  - PC <= PC + 1
<!-- !for bus read -->
* [3]  - bus_read (R)
* [4]  - bus_read (ar)  <!--??hardwired -->
* [5]  - bus_read (dr)
* [6]  - bus_read (ac)
* [7]  - bus_read (pc)
* [8]  - bus_read (ir)  <!-- ??hardwired -->
* [9] -  add
* [10] - mul
* [11] - memory_read_instruction    <!-- connect to bus -->
* [12] - memory_read_data           <!-- connect to bus -->
* [13] - memory_write
* [14] - AC <= 0
  <!-- !for bus write -->      
* [15] - write_en (R)
* [16] - write_en (ar)
* [17] - write_en (dr)
* [18] - write_en (ac)
* [19] - write_en (pc)
* [20] - write_en (ir)
* [21] - bus_read (data_memory)
* [22] - bus_read (instr_memory)
* [23] - ac_prc_wr_en ???

|State      |Control Signal              |Decimal |
|---        |---                         |---     |
|IDLE       |000-0000-0000-0000-0000-0000|0       |     
|Fetch 1*   |000-0000-1000-0100-0100-0000|33856   |     
|Fetch 2*   |010-0000-0000-0100-0000-0010|2098178 |     
|Fetch 3*   |010-1000-0000-0100-0000-0001|2622465 |     
|CLAC       |000-0000-0010-0000-0000-0000|8192    |     
|LDAC  1    |000-0000-1000-1000-1000-0000|34944   |     
|LDAC  2*   |001-0000-0000-1000-0000-0000|1050624 |
|LDAC  3    |001-0001-0000-1000-0000-0000|1116160 |
|LDAC  4    |000-0010-0000-0000-0001-0000|131088  |     
|STAC  1*   |000-0000-1000-0000-1000-0000|32896   |     
|STAC  2    |000-0001-0001-0000-0010-0000|69664   |     
|STAC  3    |000-0000-0001-0000-0001-0000|4112    |     
|STAC  4    |000-0000-0001-0000-0001-0000|4112    |     
|MVACR      |000-0000-0100-0000-0010-0000|16416   |     
|MVRAC      |000-0010-0000-0000-0000-0100|131076  |     
|ADD        |100-0000-0000-0001-0000-0100|4194564 |     
|MUL        |100-0000-0000-0010-0000-0100|4194820 |     


|Curent state        | Next state  | 
| -----------        | ----------- |
| Idle               | Fetch 1     |
| Paragraph          | Text        | -->