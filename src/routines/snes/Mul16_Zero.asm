; The zero result of the Mul16 forms: $08-$0B = 0, pull Y
Mul16_Zero:
	stz.b $08
	stz.b $0A
	ply
	rtl
