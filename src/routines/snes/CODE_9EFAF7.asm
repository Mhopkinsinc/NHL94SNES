; Unidentified routine.
CODE_9EFAF7:
	lda.w #$0007
	sta.b $A5
	lda.w #$0008
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
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
	sta.b $A5
	jsl.l CODE_9EC160
	lda.w #$0000
	sta.l $7E344A
CODE_9EFB3B:
	pla
	sta.b $8F
	pla
	sta.b $8D
	pla
	sta.b $8B
	pla
	sta.b $89
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	plx
	rtl
	padbyte $FF
	pad $9F8000
