; Unidentified routine.
CODE_9EBF5A:
	lda.w pentimer
	sec
	sbc.b d7
	sta.w pentimer
	bpl CODE_9EBFDD
	adc.w #$0018
	sta.w pentimer
	lda.w #$0020
	tsb.w sflags3
	jsl.l CODE_9EB198
	jsl.l CODE_9EB1C9
	stz.b a2
	jsl.l CODE_9EBF84
	lda.w #$0002
	sta.b a2
CODE_9EBF84:
	lda.b a2
	beq CODE_9EBF8B
	lda.w #$001A
CODE_9EBF8B:
	sta.b a0
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0002
	sta.b d1
	sta.b d3
CODE_9EBF9E:
	ldy.b a0
	lda.w tmboxlist,y
	inc.b a0
	and.w #$00FF
	sta.b d0
	bit.w #$0080
	bne CODE_9EBFDE
	lda.b a2
	beq CODE_9EBFB6
	lda.w #$0034
CODE_9EBFB6:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9EC01D
	dec.b d1
	bmi CODE_9EBF9E
	lda.b d0
	sta.b [a1]
	inc.b a1
	inc.b a1
	lda.w tmpdst,y
	dec a
	sta.w tmpdst,y
	bne CODE_9EBFDB
	jsl.l RemovePlayerFromList
CODE_9EBFDB:
	bra CODE_9EBF9E
