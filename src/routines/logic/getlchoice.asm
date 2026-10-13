; Unidentified routine.
getlchoice:
	lda.b $A9
	pha
	lda.b $AB
	pha
	lda.b $AD
	pha
	lda.b $AF
	pha
	lda.b $91
	eor.w #$0002
	tay
	lda.w tmap,y
	ldy.b $91
	sec
	sbc.w tmap,y
	sta.b $AD
	beq CODE_9FD7E5
	lda.b $A5
	clc
	adc.w #$0015
	sta.b $A5
	lda.b $AD
	bmi CODE_9FD7E5
	lda.b $A5
	clc
	adc.w #$0015
	sta.b $A5
CODE_9FD7E5:
	ldy.b $91
	lda.w tmline,y
	sta.b $A9
	lda.b $A5
	clc
	adc.b $A9
	clc
	adc.b $A9
	clc
	adc.b $A9
	sta.b $A5
	tay
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FD820
	sta.b $89
	lda.b [$89],y
	and.w #$00FF
	bit.w #$0080
	beq CODE_9FD811
	ora.w #$FF00
CODE_9FD811:
	sta.b $A5
	pla
	sta.b $AF
	pla
	sta.b $AD
	pla
	sta.b $AB
	pla
	sta.b $A9
	rtl
