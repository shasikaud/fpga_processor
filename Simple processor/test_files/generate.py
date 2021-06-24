mat1 = []
mat2 = []

mat1_rows = 0
mat1_cols = 0

mat2_rows = 0
mat2_cols = 0

muls_stage1 = []

mat1_rows = input("ENTER MATRIX 1 DIMENSIONS :: ROWS >> ")
mat1_cols = input("ENTER MATRIX 1 DIMENSIONS :: COLUMNS >> ")
mat2_rows = input("ENTER MATRIX 2 DIMENSIONS :: ROWS >> ")
mat2_cols = input("ENTER MATRIX 2 DIMENSIONS :: COLUMNS >> ")

for i in range(mat1_rows*mat1_cols):
    mat1.append(input("ENTER MATRIX 1 VALUES >> "))

for i in range(mat2_rows*mat2_cols):
    mat2.append(input("ENTER MATRIX 2 VALUES >> "))
    
#for i in range(mat1_rows):  #iterate rows MAT1
for i in range(mat1_rows):  #iterate rows MAT1
    for j in range(mat2_cols):   #iterate columns MAT2
        for k in range(mat1_cols):
            #muls_stage1.append(mat1[k]*mat2[(mat2_cols*j)+1])
            #print(k)
            #print((mat2_cols*k)+j)
            #print(k+(i*mat1_cols))
            #print((mat2_cols*k)+j)
            #muls_stage1.append(mat1[k+(i*mat1_cols)]*mat2[(mat2_cols*k)+j])
            muls_stage1.append(mat1[k+(i*mat1_cols)])
            muls_stage1.append(mat2[(mat2_cols*k)+j])


#print (muls_stage1)

f = open("matrix_data.txt", "w")
for i in muls_stage1:
    f.write(str(i)+ "\n")
f.close()
    
