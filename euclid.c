#include <stdio.h>

int gcd_euclid(int a, int b);

#define assert(cond) \
    do { if (!(cond)) { return 1; } } while(0)

int main()
{
    /*
    printf("gcd(%i, %i) = %i\n", 15, 3, gcd_euclid(15, 3));
    printf("gcd(%i, %i) = %i\n", 16, 15, gcd_euclid(16, 15));
    printf("gcd(%i, %i) = %i\n", 57, 12, gcd_euclid(57, 12));
    printf("gcd(%i, %i) = %i\n", 600, 53, gcd_euclid(600, 53));
    */

    assert(gcd_euclid(15, 3) == 3);
    assert(gcd_euclid(16, 15) == 1);
    assert(gcd_euclid(57, 12) == 3);
    assert(gcd_euclid(600, 53) == 1);
}

int gcd_euclid(int a, int b)
{
    if (b > a) {
        int temp = a;
        a = b;
        b = temp;
    }

    while (b != 0) {
        int temp = b;
        b = a % b;
        a = temp;
    }

    return a;
}
