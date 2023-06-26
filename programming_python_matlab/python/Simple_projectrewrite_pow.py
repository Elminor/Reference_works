def pow(x,y):
    x = float(x)
    y = float(y)
    result = 1
    i = 0
    y_abs = y
    if y < 0:
        y_abs = 0 - y
    while i < y_abs:
        result = x * result
        i += 1
    if y < 0:
        result = 1 / result
    return result

pow(9,0.5)
print (f"Hello, {pow(9,0.5)}.")
result = pow(9,0.5)
print (f"Hello, {result}.")
