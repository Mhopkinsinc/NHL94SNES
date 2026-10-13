; Unidentified routine.
CODE_9EBF5A:
	lda.w pentimer
	sec
	sbc.b $C1
	sta.w pentimer
	bpl CODE_9EBFDD
	adc.w #$0018
	sta.w pentimer
	lda.w #$0020
	tsb.w sflags3
	jsl.l CODE_9EB198
	jsl.l CODE_9EB1C9
	stz.b $91
	jsl.l CODE_9EBF84
	lda.w #$0002
	sta.b $91
CODE_9EBF84:
	lda.b $91
	beq CODE_9EBF8B
	lda.w #$001A
CODE_9EBF8B:
	sta.b $89
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w #$0002
	sta.b $A9
	sta.b $B1
CODE_9EBF9E:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $A5
	bit.w #$0080
	bne CODE_9EBFDE
	lda.b $91
	beq CODE_9EBFB6
	lda.w #$0034
CODE_9EBFB6:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9EC01D
	dec.b $A9
	bmi CODE_9EBF9E
	lda.b $A5
	sta.b [$8D]
	inc.b $8D
	inc.b $8D
	lda.w tmpdst,y
	dec a
	sta.w tmpdst,y
	bne CODE_9EBFDB
	jsl.l RemovePlayerFromList
CODE_9EBFDB:
	bra CODE_9EBF9E
