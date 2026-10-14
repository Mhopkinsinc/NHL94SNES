; Unidentified routine.
CODE_9FD907:
	lda.w #$EA1A
	ldy.w position,x
	bne CODE_9FD912
	lda.w #$E0FE
CODE_9FD912:
	jsl.l CODE_9EA3F1
	lda.w #$0001
	sta.w $1563,x
	lda.w facedir,x
	cmp.w #$0004
	beq CODE_9FD92B
	inc a
	and.w #$0007
	sta.w facedir,x
CODE_9FD92B:
	stz.w $0EE3,x
	lda.w #$F800
	sta.w $0EC3,x
	lda.b d0
	sec
	sbc.w #$0010
	beq CODE_9FD93E
	bpl CODE_9FD96D
CODE_9FD93E:
	stz.w $0EC3,x
	lda.w facedir,x
	cmp.w #$0004
	bne CODE_9FD96D
	lda.w #$F800
	sta.w $0EC3,x
	lda.w #$0002
	sta.w facedir,x
	lda.w #$E936
	ldy.w position,x
	bne CODE_9FD960
	lda.w #$E484
CODE_9FD960:
	jsl.l CODE_9EA3F1
	lda.w #$0064
	sta.w $1003,x
	sta.w pfalock,x
CODE_9FD96D:
	rtl
