

mergelist a b = 
	mergelist0 a b


mergelist0 a [] =
	a
mergelist0 [] b =
	b
mergelist0  g@(a0:a) k@(b0:b) 
	| a0 < b0 = a0:mergelist0 a k
	| a0 > b0 = b0: mergelist g b
	| otherwise = a0:b0:mergelist  a b
