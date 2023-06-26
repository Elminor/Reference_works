lst = [1, 2, 56, 32, 51, 2, 8, 92, 15]

def BubbleSort(lst):
    n = len(lst)
    i = 0
    while i < n -1:
        j = 0
        while j < n -i -1:
            if lst[j] > lst[j + 1]:
                ogLst = lst[j]
                lst[j] = lst[j + 1]
                lst[j + 1] = ogLst
            j += 1
        i += 1
    return lst
print(lst)
print(BubbleSort(lst))