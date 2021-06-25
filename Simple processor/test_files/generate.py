mat1 = []
mat2 = []

mat1_rows = 0
mat1_cols = 0

mat2_rows = 0
mat2_cols = 0

muls_stage1 = []

mat1_rows = int(input("ENTER MATRIX 1 DIMENSIONS :: ROWS >> "))
mat1_cols = int(input("ENTER MATRIX 1 DIMENSIONS :: COLUMNS >> "))
mat2_rows = int(input("ENTER MATRIX 2 DIMENSIONS :: ROWS >> "))
mat2_cols = int(input("ENTER MATRIX 2 DIMENSIONS :: COLUMNS >> "))

for i in range(mat1_rows*mat1_cols):
    mat1.append(input("ENTER MATRIX 1 VALUES >> "))

for i in range(mat2_rows*mat2_cols):
    mat2.append(input("ENTER MATRIX 2 VALUES >> "))
    
for i in range(mat1_rows):  #iterate rows MAT1
    for j in range(mat2_cols):   #iterate columns MAT2
        for k in range(mat1_cols):
            muls_stage1.append(mat1[k+(i*mat1_cols)])
            muls_stage1.append(mat2[(mat2_cols*k)+j])


#print (muls_stage1)
#print (len(muls_stage1))

f = open("matrix_data.txt", "w")
for i in muls_stage1:
    f.write(str(i)+ "\n")
f.close()

#######################################################
################ [3][3] * [3][3]  #####################
#######################################################

# 1 - 54 >>  mul digits
# 55 - 82 >> multiplied values
# 83 - 90 >> store temp pair addition
# 91 - 100 >> row/col sum

instructions = [0]

#muls_stage1 = [3, 9, 5, 5, 6, 9, 3, 1, 5, 7, 6, 2, 3, 4, 5, 7, 6, 9, 4, 9, 1, 5, 2, 9, 4, 1, 1, 7, 2, 2, 4, 4, 1, 7, 2, 9, 1, 9, 9, 5, 8, 9, 1, 1, 9, 7, 8, 2, 1, 4, 9, 7, 8, 9]

load1 = 1024
load2 = 2048
mul = 5120
add = 4096
store = 3072

for i in range(int(len(muls_stage1)/2)):
    instructions.append(load1+(2*i)+1)
    instructions.append(load2+(2*i)+2)
    instructions.append(mul)
    instructions.append(store+55+i) #starts with 55th position

for i in range(9):
    instructions.append(load1+55+(3*i))
    instructions.append(load2+55+(3*i)+1)
    instructions.append(add)
    instructions.append(store+83+i) #starts with 83th position
    instructions.append(load1+83+i)
    instructions.append(load2+57+(3*i))
    instructions.append(add)
    instructions.append(store+91+i) #starts with 91th position


f = open("instructions_test.txt", "w")
for i in instructions:
    f.write(str(i)+ "\n")
f.close()

#####

