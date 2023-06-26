#min():
def minimum(a,b):
    if a < b:
        print(str(a) + " is smaller than "+ str(b))
        return a
    elif a == b:
        print("Equals")
        return a
    else:
        print(str(b) + " is smaller than " + str(a))
        return b

minimum(-5,99)

"""
#max() list
lst = ["elso", "masodik", "harmadik"]
x = lst[0]

print (x)

for item in lst:
    print (item)

index = 0
while index < len(lst):
    print (lst[index])
    index+=1
"""