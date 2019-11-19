matrix = [[1,2,3],[4,5,6],[7,8,9]]

for i in range(0,6):
  print ("---")
  for k in range(0,10):
    poy = i - k
    if (  poy < 0  or k > len(matrix) -1 or poy > len(matrix) -1 ):
      continue
    # print (str(k) + " " + str(poy))
    print (matrix[k][poy])

