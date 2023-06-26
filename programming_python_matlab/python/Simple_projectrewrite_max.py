#max() list

lst = [-1, -12, -5026, -4, -99, -5, 0]
#x = lst[0]

#print (x)
def maxlist(lst):
    index = 0
    value = lst[0]
    while index < len(lst):
        if lst[index] >= value:
            value = lst[index]
        else:
            value = value
        index+=1
    print(value)
    print(str(value) + " is the maximum value in the list")

maxlist(lst)