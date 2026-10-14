; From the bench: wait out the lock, then take the assignment
asseben:
	lda.w gmclock
	bne CODE_9E82A0
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E82CF
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1003,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3
	lda.w $0792
	and.w #$0003
	sta.w $1043,x
CODE_9E82CF:
	lda.w $1003,x
	sec
	sbc.b d7
	sta.w $1003,x
	bpl CODE_9E8321
	adc.w $1323,x
	bpl CODE_9E82E2
CODE_9E82DF:
	lda.w #$0000
CODE_9E82E2:
	sta.w $1003,x
	jsl.l CODE_9EC417
	lda.w $1E8B
	beq CODE_9E830D
	lda.w Ypos,x
	sta.b d0
	bpl CODE_9E82FD
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
CODE_9E82FD:
	cmp.w #$0090
	bpl CODE_9E830D
	lda.w #$0010
	sta.b d0
	jsl.l assreplace
	bra CODE_9E8373
