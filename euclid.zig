const std = @import("std");

pub fn main() void {
    std.debug.assert(gcd_euclid(15, 3) == 3);
    std.debug.assert(gcd_euclid(16, 15) == 1);
    std.debug.assert(gcd_euclid(57, 12) == 3);
    std.debug.assert(gcd_euclid(600, 53) == 1);
}

fn gcd_euclid(a_arg: isize, b_arg: isize) isize {
    var a = a_arg;
    var b = b_arg;

    if (a < b) {
        const temp = b;
        b = a;
        a = temp;
    }

    while (b != 0) {
        const temp = b;
        b = @mod(a, b);
        a = temp;
    }

    return a;
}
