fn main() {
    /*
    println!("gcd({}, {}) = {}", 15, 3, gcd_euclid(15, 3));
    println!("gcd({}, {}) = {}", 16, 15, gcd_euclid(16, 15));
    println!("gcd({}, {}) = {}", 57, 12, gcd_euclid(57, 12));
    println!("gcd({}, {}) = {}", 600, 53, gcd_euclid(600, 53));
    */
    assert!(gcd_euclid(15, 3) == 3);
    assert!(gcd_euclid(16, 15) == 1);
    assert!(gcd_euclid(57, 12) == 3);
    assert!(gcd_euclid(600, 53) == 1);
}

fn gcd_euclid(mut a: isize, mut b: isize) -> isize {
    while b != 0 {
        let temp = b;
        b = a % b;
        a = temp;
    }

    a
}
