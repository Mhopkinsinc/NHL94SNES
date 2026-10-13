; Unidentified routine.
CODE_9EB9D1:
	jsl.l ClearPenaltyBuffer
CODE_9EB9D5:
	ldy.b $91
	lda.w tmap,y
	ldy.b $8D
	sec
	sbc.w tmap,y
	beq CODE_9EBA36
	bmi CODE_9EBA36
	lda.b $8D
	beq CODE_9EB9EB
	lda.w #$001A
CODE_9EB9EB:
	sta.b $89
CODE_9EB9ED:
	ldy.b $89
	lda.w tmboxlist,y
	inc.b $89
	and.w #$00FF
	sta.b $AD
	bit.w #$0080
	bne CODE_9EBA36
	lda.b $8D
	beq CODE_9EBA05
	lda.w #$0034
CODE_9EBA05:
	clc
	adc.b $AD
	tay
	lda.w tmpdst,y
	bit.w #$4000
	bne CODE_9EB9ED
	lda.w #$0000
	sta.w tmpdst,y
	jsl.l RemovePlayerFromList
	ldy.b $8D
	lda.w tmap,y
	inc a
	sta.w tmap,y
	ldy.b $91
	lda.w $1742,y
	inc a
	sta.w $1742,y
	lda.w #$0001
	tsb.w tmflags
	tsb.w $17E0
CODE_9EBA36:
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
	rtl
