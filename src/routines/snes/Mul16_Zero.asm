; The zero result of the Mul16 forms: $08-$0B = 0, pull Y
Mul16_Zero:
	stz.b r2
	stz.b r2+2
	ply
	rtl
