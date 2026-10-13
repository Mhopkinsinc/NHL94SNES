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
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	jsl.l CODE_9EBEA1
	lda.b $08
	sta.b $A9
	sta.w $1063,x
	lda.w #$0088
	sta.w $1043,x
	stz.w $1003,x
	lda.w pflags,x
	ora.w #$8000
	sta.w pflags,x
	stz.w $1103,x
	stz.w $1123,x
	lda.w #$0384
	sta.w $1083,x
CODE_9EBD1D:
	lda.w $1083,x
	sec
	sbc.w $0ADB
	sta.w $1083,x
	bpl CODE_9EBD45
CODE_9EBD29:
	jmp.w $BDC9
