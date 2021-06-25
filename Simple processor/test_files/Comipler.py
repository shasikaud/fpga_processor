param_1 = int(input('No. of Rows of Matrix 1: '))
param_2 = int(input('No. of Columns of Matrix 1: '))
param_3 = int(input('No. of Columns of Matrix 2: '))

matrix_1 = param_1*param_2
matrix_2 = matrix_1 + param_2*param_3
matrix_3 = matrix_2 + param_3*param_1

instructions = []
ADD = 4096
MUL = 5120

for i in range(1, param_1 + 1):
    for j in range(1, param_3 + 1):
        for k in range(1, param_2+1):
            LDR1 = 1024 + param_2*(i-1) + k
            LDR2 = 2048 + matrix_1 + param_3*(k-1) + j
            STAC = 3072 + matrix_3 + k
            instructions.append(LDR1)
            instructions.append(LDR2)
            instructions.append(MUL)
            instructions.append(STAC)
        for t in range(1, param_2):
            LDR1 = 1024 + matrix_3 + t
            LDR2 = 2048 + matrix_3 + t+1
            STAC = 3072 + matrix_3 + t+1
            instructions.append(LDR1)
            instructions.append(LDR2)
            instructions.append(ADD)
            instructions.append(STAC)
        STAC = 3072 + matrix_2 + param_3*(i-1) + j
        instructions.append(STAC)

for i in range(matrix_2+1, matrix_3+1):
    LDR1 = 1024 + i
    LDR2 = 2048 + i
    instructions.append(LDR1)
    instructions.append(LDR2)

instructions_text = '\n'. join(map(str, instructions))

file = open('intsructions_test.txt', 'w')
file.writelines(instructions_text)

file.close()



