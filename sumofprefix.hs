sumofprefix::[Int] -> [Int]
sumofprefix xs = sumofprefix_b 0 xs


sumofprefix_b:: Int -> [Int] -> [Int]
sumofprefix_b _ [] = []
sumofprefix_b a (x:xs) = k:sumofprefix_b k xs
                      where k = a + x
