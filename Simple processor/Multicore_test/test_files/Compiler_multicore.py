#no fo cores
cores = 4

#get inputs from text file
matrix1 = []
matrix2 = []

matrix1_nested = []
matrix2_nested = []


file = open('input.txt', 'r')
input_file = file.readlines()
file.close()

for i in range(0, len(input_file)):
    if(input_file[i].strip() == ''):
        break
    row = input_file[i].strip().split(' ')
    matrix1_nested.append(row)
    for element in row:
        matrix1.append(element)

print('Matrix 1:')
for r in matrix1_nested:
    print(' '.join(r))

for j in range(i+1, len(input_file)):
    
    if(input_file[j].strip() == ''):
        break
    row = input_file[j].strip().split(' ')
    matrix2_nested.append(row)
    for element in row:
        matrix2.append(element)


print('Matrix 2:')
for r in matrix2_nested:
    print(' '.join(r))


file = open('data.txt', 'w')
matrix1_text = '\n'. join(map(str, matrix1))
matrix2_text = '\n'. join(map(str, matrix2))

file.writelines(matrix1_text+'\n')
file.writelines(matrix2_text)

file.close()


#get matrix dimensions
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

#generate instructions list to inddividual cores
instructions = []
for n in range(0, cores):
    instructions.append([])
ADD = 4096
MUL = 5120

for i in range(1, param_1 + 1):
    for j in range(1, param_3 + 1):
        core_index = (param_3*(i-1) + j)%cores
        shift = core_index*param_2
        for k in range(1, param_2+1):
            LDR1 = 1024 + param_2*(i-1) + k
            LDR2 = 2048 + matrix_1 + param_3*(k-1) + j
            STAC = 3072 + matrix_3 + k + shift
            instructions[core_index].append(LDR1)
            instructions[core_index].append(LDR2)
            instructions[core_index].append(MUL)
            instructions[core_index].append(STAC)
        for t in range(1, param_2):
            LDR1 = 1024 + matrix_3 + t + shift
            LDR2 = 2048 + matrix_3 + t + 1 + shift
            STAC = 3072 + matrix_3 + t + 1 + shift
            instructions[core_index].append(LDR1)
            instructions[core_index].append(LDR2)
            instructions[core_index].append(ADD)
            instructions[core_index].append(STAC)
        STAC = 3072 + matrix_2 + param_3*(i-1) + j
        instructions[core_index].append(STAC)


#write instructions to txt file (per each core)
for core_no in range(1, cores + 1):
    core_index = core_no%cores
    instructions_text = '\n'. join(map(str, instructions[core_index]))

    file = open('instructions_core_' + str(core_no) + '.txt', 'w')
    file.writelines(str(0) + '\n')
    file.writelines(instructions_text)

    file.close()

#store additional data to txt files
file = open('Summary.txt', 'w')
file.writelines('Matrix 1:' + '\n')
for r in matrix1_nested:
    file.writelines(' '.join(r) +  '\n')

file.writelines('\n')
file.writelines('Matrix 2:' + '\n')
for r in matrix2_nested:
    file.writelines(' '.join(r) +  '\n')

file.close()

file = open('Dimensions.txt', 'w')
file.writelines(str(param_3) + '\n') #no of columns of matrix 2
file.writelines(str(param_1) + '\n') #no of rows of matrix 1
file.close()

