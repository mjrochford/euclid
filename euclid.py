def gcd_euclid(a, b):
    while b != 0:
        t = b
        b = a % b
        a = t
    return a

assert(gcd_euclid(15, 3) == 3)
assert(gcd_euclid(16, 15) == 1)
assert(gcd_euclid(57, 12) == 3)
assert(gcd_euclid(600, 53) == 1)
