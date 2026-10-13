; Unidentified routine.
CODE_9EBCD2:
	jsl.l CODE_9EBDF8
	lda.w pflags,x
	and.w #$FFF9
	ora.w #$1000
	sta.w pflags,x
	lda.w #$0000
	sta.b $B5
	jsl.l CODE_9BC174
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	jsl.l CODE_9EBEA1
	lda.b $08
	sta.b $A9
	sta.w temp4,x
	lda.w #$0088
	sta.w temp3,x
	stz.w temp1,x
	lda.w pflags,x
	ora.w #$8000
	sta.w pflags,x
	stz.w $1103,x
	stz.w $1123,x
	lda.w #$0384
	sta.w temp5,x
CODE_9EBD1D:
	lda.w temp5,x
	sec
	sbc.w $0ADB
	sta.w temp5,x
	bpl CODE_9EBD45
CODE_9EBD29:
	jmp.w $BDC9
