; Unidentified routine.
CODE_9E82A7:
	lda.w gmclock
	bne CODE_9E82A0
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E82CF
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b
	lda.w seed
	and.w #$0003
	sta.w temp3,x
CODE_9E82CF:
	lda.w temp1,x
	sec
	sbc.b $C1
	sta.w temp1,x
	bpl CODE_9E8321
	adc.w aioff,x
	bpl CODE_9E82E2
CODE_9E82DF:
	lda.w #$0000
CODE_9E82E2:
	sta.w temp1,x
	jsl.l CODE_9EC417
	lda.w $1E8B
	beq CODE_9E830D
	lda.w Ypos,x
	sta.b $A5
	bpl CODE_9E82FD
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9E82FD:
	cmp.w #$0090
	bpl CODE_9E830D
	lda.w #$0010
	sta.b $A5
	jsl.l assreplace
	bra CODE_9E8373
