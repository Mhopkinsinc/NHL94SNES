; Unidentified routine.
CODE_9F91C1:
	lda.w #$0005
	sta.l $7E3568,x
	lda.b d1
	sta.b d3
	jsl.l NewTicker3
	lda.w #$00B4
	sta.b d0
	jsl.l CODE_9FA5EA
	lda.b d1
	bit.w #$1000
	beq CODE_9F91E8
CODE_9F91E0:
	lda.w #$0008
	tsb.w sflags3
	bra CODE_9F91EE
