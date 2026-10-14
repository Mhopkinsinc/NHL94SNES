; Unidentified routine.
CODE_9DC9C1:
	lda.w #$3400
	sta.w $1E87
CODE_9DC9C7:
	lda.b d0
	ldy.b a2
	sta.b d0
	lda.w HomeTeam,y
	ldx.w #$001A
	jsl.l CODE_808F4C
	clc
	adc.b d0
	asl a
	asl a
	tax
	lda.l PlayerPhotoTable,x
	sta.b $0C
	lda.l PlayerPhotoTable+2,x
	sta.b $0E
	lda.w #$007F
	sta.b $12
	lda.w #$0000
	sta.b $10
	jsl.l Decompress
	stx.b $00
	lda.b a2
	beq CODE_9DCA08
	lda.w #$6900
	sta.b $10
	sta.l $7E3472
	bra CODE_9DCA11
