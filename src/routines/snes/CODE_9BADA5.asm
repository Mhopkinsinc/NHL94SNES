; Unidentified routine.
CODE_9BADA5:
	phk
	plb
	jsl.l CODE_9B851F
	lda.w #$FFFE
	sta.w $0CAB
	lda.w #$0020
	tsb.w sflags
	asl.b d0
	asl.b d0
	ldy.b d0
	lda.w DATA8_9BAE57,y
	adc.w $0D75
	sta.b d2
	ldx.w #$0020
	lda.w DATA8_9BAE57,y
	xba
	and.w #$FF00
	sta.w $0EC3,x
	lda.w $AE59,y
	clc
	adc.w $0DD7
	sta.b d3
	lda.w $AE59,y
	xba
	and.w #$FF00
	sta.w $0EE3,x
	lda.b d2
	pha
	lda.b d3
	pha
	stx.b a3
	stz.w $1103,x
	stz.w $1123,x
	lda.w #$0001
	sta.w $0D3B
	sta.w $0D3D
	jsl.l checkwallcoll
	pla
	sta.b d3
	pla
	sta.b d2
	lda.w $1123,x
	ora.w $1103,x
	beq CODE_9BAE3E
CODE_9BAE0E:
	lda.w $1123,x
	asl a
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BAE1E
	ora.w #$FF00
CODE_9BAE1E:
	clc
	adc.w $0D75
	sta.b d2
	lda.w $1103,x
	asl a
	xba
	and.w #$00FF
	cmp.w #$0080
	bcc CODE_9BAE34
	ora.w #$FF00
CODE_9BAE34:
	eor.w #$FFFF
	inc a
	clc
	adc.w $0DD7
	sta.b d3
CODE_9BAE3E:
	lda.b d2
	sta.w $0D75
	sta.w Hpos
	lda.b d3
	sta.w $0DD7
	sta.w Vpos
	lda.w #$0010
	sta.w $0AF3
	jmp.w CODE_9BABAB
