; Unidentified routine.
	asl.b $A5
	lda.b $91
	beq CODE_9F9879
	lda.w #$0034
CODE_9F9879:
	adc.b $A5
	tay
	lda.w tmpde,y
	sta.b $08
	lda.l $7E34C6
	cmp.w #$0002
	bne CODE_9F988F
CODE_9F988A:
	lda.w #$1000
	sta.b $08
CODE_9F988F:
	lda.w #$0028
	sta.b $04
	phx
	jsl.l Div16x8U
	plx
	lda.b $00
	cmp.w #$0065
	bcc CODE_9F98A4
	lda.w #$0064
CODE_9F98A4:
	sta.b $A5
	bra CODE_9F98B1
