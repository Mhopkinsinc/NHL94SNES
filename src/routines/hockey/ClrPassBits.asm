; Clear the password bits
ClrPassBits:
	lda.w #$0000
	sta.l passbits
	sta.l $7E350A
	sta.l $7E350C
	sta.l $7E350E
	sta.l $7E3510
	sta.l $7E3512
	sta.l $7E3514
	sta.l $7E3516
	rtl
