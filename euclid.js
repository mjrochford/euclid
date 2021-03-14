const assert = require('assert');

function gcd_euclid(a, b) {
    if (b > a) {
        [a, b] = [b, a]
    }

    while (b != 0) {
        const t = b
        b = a % b
        a = t
    }

    return a
}

assert(gcd_euclid(15, 3) == 3)
assert(gcd_euclid(16, 15) == 1)
assert(gcd_euclid(57, 12) == 3)
assert(gcd_euclid(600, 53) == 1)
