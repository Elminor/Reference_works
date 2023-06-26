"""
#multiply()
def multiply(x, y):
    a = 0
    for i in range(y):
        a += x
    return a
print(multiply(-1,4))
"""
#multiply()
def multiply_v2(x, y):
    a = 0
    i = 1
    y_abs = y
    x_abs = x
    if y < 0:
        y_abs = 0 - y
    if x < 0:
        x_abs = 0 - x

    while i <= y_abs:   
            a += x_abs
            i += 1
    if (x < 0 and y > 0) or (x > 0 and y < 0):
        a = 0 - a
    return a
    
print(multiply_v2(100,0))