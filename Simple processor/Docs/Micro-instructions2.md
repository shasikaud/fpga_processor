
# Instruction format
IR[15:10] operation
IR[9:0] operand address

# Micro-instructions

## Fetch
* Fetch 1 : AR <= PC; read
* Fetch 2 : PC <= PC + 1 
* Fetch 3 : IR <= I_M[t] 
* Fetch 4 :
* Fetch 5 :
* Fetch 6 : 
## LDR1
* LDR1 1: AR <= IR; read
* LDR1 2:
* LDR1 3: R1 <= D_M[t]
* LDR1 4:

## LDR2
* LDR2 1: AR <= IR; read
* LDR2 2:
* LDR2 3: R2 <= D_M[t]
* LDR2 4:

## STAC
* STAC 1: AR <= IR;
* STAC 2: 
* STAC 3: D_M[t] <= AC
* STAC 4:

## ADD
* ADD 1: AC <= R1 + R2
* ADD 2: 

## MUL
* MUL 1: AC <= R1 x R2
* MUL 2: 
