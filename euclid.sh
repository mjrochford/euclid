function gcd_euclid() {
    if [ $1 -gt $2 ]; then
        a=$1
        b=$2
    else
        a=$2
        b=$1
    fi

    while [ $b -ne 0 ]; do
        t=$b
        b=$(( $a % $b ))
        a=$t
    done

    echo $a
}

[ $(gcd_euclid 15 3) -ne 3 ] && echo FAIL
[ $(gcd_euclid 16 15) -ne 1 ] && echo FAIL
[ $(gcd_euclid 57 12) -ne 3 ] && echo FAIL
[ $(gcd_euclid 600 53) -ne 1 ] && echo FAIL
