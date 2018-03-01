{-| isOneAway compares 2 strings such that the difference should
	one alphabet
	"hello" "ello" -> True
	"heyy" "hello" -> False
	"hllo" "hello" -> True
-}
isOneAway str0 str1 
	| abs (k - l)  > 1 = False
	| otherwise = g
		where 	k = length str0
			l = length str1
			g = 
				if k > l  then
					will str0 str1 0
				else 
					will str1 str0 0
			
will :: [Char] -> [Char] -> Int -> Bool	
will [] [] n 
	| n > 1 = False
	| otherwise = True			
will a [] n
	| (n + 1) > 1 = False
	| otherwise = True
will (s0:xs0) a@(s1:xs1) n
	| n > 1 = False
	| s0 == s1 = will xs0 xs1 n
	| otherwise = will xs0 a (n+1)

