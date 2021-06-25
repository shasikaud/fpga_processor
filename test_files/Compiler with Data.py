matrix1 = []
matrix2 = []

matrix1_nested = []
matrix2_nested = []
i=1
j=1

while(True):
 
    
    row = input('Input row ' + str(i) + ' of matrix 1: ').split(' ')

    if(row == ['']):
        break
    else:
        matrix1_nested.append(row)
        for element in row:
            matrix1.append(element)
        i+=1

print('Matrix 1:')
for r in matrix1_nested:
    print(' '.join(r))


while(True):
 
    
    row = input('Input row ' + str(j) + ' of matrix 2: ').split(' ')

    if(row == ['']):
        break
    else:
        matrix2_nested.append(row)
        for element in row:
            matrix1.append(element)
        j+=1

print('Matrix 2:')
for r in matrix2_nested:
    print(' '.join(r))


file = open('data.txt', 'w')
matrix1_text = '\n'. join(map(str, matrix1))
matrix2_text = '\n'. join(map(str, matrix2))

file.writelines(matrix1_text)
file.writelines(matrix2_text)

file.close()



param_1 = len(matrix1_nested)
param_2 = len(matrix1_nested[0])
param_3 = len(matrix2_nested[0])

matrix_1 = param_1*param_2
matrix_2 = matrix_1 + param_2*param_3
matrix_3 = matrix_2 + param_3*param_1

file = open('final.txt', 'w')
file.writelines(str(matrix_2 + 1) + '\n')
file.writelines(str(matrix_3) + '\n')
file.close()

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

file = open('instructions.txt', 'w')
file.writelines(str(0) + '\n')
file.writelines(instructions_text)

file.close()


