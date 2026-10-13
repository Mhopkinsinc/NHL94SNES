; Unidentified routine.
CODE_9FD907:
	lda.w #SPAglide
	ldy.w position,x
	bne CODE_9FD912
	lda.w #SPAgready
CODE_9FD912:
	jsl.l CODE_9EA3F1
	lda.w #$0001
	sta.w pfnc,x
	lda.w facedir,x
	cmp.w #$0004
	beq CODE_9FD92B
	inc a
	and.w #$0007
	sta.w facedir,x
CODE_9FD92B:
	stz.w Yvel,x
	lda.w #$F800
	sta.w Xvel,x
	lda.b $A5
	sec
	sbc.w #$0010
	beq CODE_9FD93E
	bpl CODE_9FD96D
CODE_9FD93E:
	stz.w Xvel,x
	lda.w facedir,x
	cmp.w #$0004
	bne CODE_9FD96D
	lda.w #$F800
	sta.w Xvel,x
	lda.w #$0002
	sta.w facedir,x
	lda.w #SPAwallleft
	ldy.w position,x
	bne CODE_9FD960
	lda.w #DATA8_9DE484
CODE_9FD960:
	jsl.l CODE_9EA3F1
	lda.w #$0064
	sta.w temp1,x
	sta.w pfalock,x
CODE_9FD96D:
	rtl
