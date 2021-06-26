file = open('Dimensions.txt', 'r')
dimensions = file.readlines()
rows = int(dimensions[1].strip())
columns = int(dimensions[0].strip())
file.close()

file = open('final_matrix.txt', 'r')
final_matrix_file = file.readlines()

file.close()

final_matrix =[]

for line in final_matrix_file:
    final_matrix.append(line.strip())

result = []

for i in range(0, int(len(final_matrix)/columns)):
    row = []
    for j in range(0, columns):
        row.append(final_matrix[columns*i + j])
    result.append(row)



print('Result:')
for r in result:
    print(' '.join(r))


file = open('Summary.txt', 'a')
file.writelines('\n')
file.writelines('Result:' + '\n')
for r in result:
    file.writelines(' '.join(r) +  '\n')
file.close()