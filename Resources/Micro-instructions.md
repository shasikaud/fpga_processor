
# Instruction format
IR[15:10] operation
IR[9:0] operand address

# Micro-instructions

## Fetch
* Fetch 1 : AR <= PC; read
* Fetch 2 : PC <= PC + 1 
<!-- * Fetch 2.5 : add latency-->
* Fetch 3 : IR <= I_M[t]  

## CLAC
* CLAC 1 : AC <= 0;

## LDAC
* LDAC 1: AR <= PC; read
* LDAC 2: PC <= PC + 1
* LDAC 3: DR <= D_M[t]
* LDAC 4: AC <= DR

## STAC
* STAC 1: AR <= PC;
* STAC 2: DR <= AC; PC <= PC +1 ; mem_write 
* STAC 3: D_M[t] <= DR
* STAC 4: ??? check latency

## MVACR
* MVACR 1: R <= AC;

## MVRAC
* MVRAC 1: AC <= R; 

## ADD
* ADD 1: AC <= AC + R

## MUL
* MUL 1: AC <= AC x R

