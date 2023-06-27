lst = [1, 2, 4, 7, 11, 22, 38, 42, 43]

def BinSort(lst, kereso):
    start = 0
    end = len(lst) - 1
    mid = 0
    while start <= end:
        mid = int((start + end)/2)
        if lst[mid] == kereso:
            return mid
        else:
            if lst[mid] > kereso:
                end = mid - 1
            else:
                start = mid + 1
    else:
        return -1

print(lst)
print(BinSort(lst, 43))