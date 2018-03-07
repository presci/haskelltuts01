

removedups [] = []
removedups [x] = [x]
removedups (a0:a1:xs) 
	| a0 == a1 = removedups (a1:xs)
	| otherwise = a0:removedups (a1:xs)

	 
