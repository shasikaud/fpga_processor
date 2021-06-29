import numpy as np

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


print('Matrix 1:')
for r in matrix1_nested:
    print(' '.join(r))
print('\n')

for j in range(i+1, len(input_file)):
    
    if(input_file[j].strip() == ''):
        break
    row = input_file[j].strip().split(' ')
    matrix2_nested.append(row)

print('Matrix 2:')
for r in matrix2_nested:
    print(' '.join(r))
print('\n')


#compute expected result (for verification)
matrix1_test = []
matrix2_test = []

for r in matrix1_nested:
    row = list(map(int, r))
    matrix1_test.append(row)

for r in matrix2_nested:
    row = list(map(int, r))
    matrix2_test.append(row)

matrix1_test = np.array(matrix1_test)
matrix2_test = np.array(matrix2_test)

result_matrix = list(map(list,np.matmul(matrix1_test, matrix2_test)))

for i in range(0, len(result_matrix)):
    result_matrix[i] = list(map(str, result_matrix[i]))

print('Result(Expected):')
for r in result_matrix:
    print(' '.join(r))
print('\n')


#rearrange the nresult from processor
rows = len(matrix1_nested)
columns = len(matrix2_nested[0])


file = open('final_matrix.txt', 'r')
final_matrix_file = file.readlines()

file.close()

final_matrix =[]

for line in final_matrix_file:
    final_matrix.append(line.strip())

result = []

for i in range(0, rows):
    row = []
    for j in range(0, columns):
        row.append(final_matrix[columns*i + j])
    result.append(row)


print('Result(From Processor):')
for r in result:
    print(' '.join(r))


# store the inputs and expected output to text file
file = open('Summary.txt', 'w')
file.writelines('Matrix 1:' + '\n')
for r in matrix1_nested:
    file.writelines(' '.join(r) +  '\n')

file.writelines('\n')
file.writelines('Matrix 2:' + '\n')
for r in matrix2_nested:
    file.writelines(' '.join(r) +  '\n')

file.writelines('\n')
file.writelines('Result(Expected):' + '\n')
for r in result_matrix:
    file.writelines(' '.join(r) +  '\n')

file.writelines('\n')
file.writelines('Result(From Processor):' + '\n')
for r in result:
    file.writelines(' '.join(r) +  '\n')
file.close()