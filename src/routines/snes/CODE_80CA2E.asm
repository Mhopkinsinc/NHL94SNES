; Unidentified routine.
CODE_80CA2E:
	ldx.b $91
	lda.w HomeTeam,x
	sta.l $7E3454
	lda.w #$FFFF
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	jsl.l CODE_80CAE1
	jsl.l CODE_9DE0D4
	jsl.l CODE_80CC1B
	stz.w $1DB9
	lda.w #$0001
	sta.w $0D43
	stz.w $0D47
	jsl.l CODE_80CC89
	lda.w #$0005
	ldx.w #$0050
	jsl.l CODE_9DCCF5
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
CODE_80CA70:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$0800
	bne CODE_80CAB8
	bit.w #$0400
	bne CODE_80CAC6
	bit.w #$8080
	bne CODE_80CAD7
	bit.w #$1000
	bne CODE_80CA9C
CODE_80CA9A:
	bra CODE_80CA70
