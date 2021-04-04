import Control.Exception

gcd_euclid a b =
    if a == b then
       a
    else if a > b then
       gcd (a-b) b
    else
       gcd(b-a) a

main :: IO()
main = do {
          assert ((gcd_euclid 15 3) == 3)
          assert ((gcd_euclid 16 15) == 1)
          assert ((gcd_euclid 57 12) == 3)
          assert ((gcd_euclid 600 53) == 1)
          return ()
          }

