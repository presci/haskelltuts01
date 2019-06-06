"""insert right 2n, insert left 2n+1
"""



def heapme(k, arr=None):
    if ( arr == None):
        return [k]
    if ( len (arr) <=0):
        return [k]
    arr.append(k)
    return heapify(arr)

def heapify(arr):
    if (len(arr) <= 0):
        return
    curr = len(arr) -1
    loc = arr[curr]
    while( curr <= 0):
        parent = getparent(curr)
        if ( arr[parent] > arr[curr]): 
            return arr
        else:
            tmp = arr[parent]
            arr[parent]  = arr[curr]
            arr[curr] = tmp
            curr = parent
    return arr


def getparent(index):
    if index % 2 == 1: 
        """ it is right node"""
        return ((index -1)/2)
    else:
        return index /2 
        

arr0 = heapme(10)
arr0 = heapme(20, arr0)
arr0 = heapme(19, arr0)
arr0 = heapme(7, arr0)
print arr0
