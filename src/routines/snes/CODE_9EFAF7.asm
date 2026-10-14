; Unidentified routine.
CODE_9EFAF7:
	lda.w #$0007
	sta.b d0
	lda.w #$0008
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	lda.w #$0002
	sta.w printx
	sta.w printy
	lda.w sfhormode
	beq CODE_9EFB21
	lda.w #$000D
	sta.w printx
	lda.w #$000F
	sta.w printy
CODE_9EFB21:
	jsl.l eraser
	lda.w #$0200
	tsb.w sflags
	lda.w #$FFFF
	sta.b d0
	jsl.l CODE_9EC160
	lda.w #$0000
	sta.l $7E344A
CODE_9EFB3B:
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	plx
	rtl
	padbyte $FF
	pad $9F8000
