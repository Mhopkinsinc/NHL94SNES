; Unidentified routine.
CODE_9BADA5:
	phk
	plb
	jsl.l CODE_9B851F
	lda.w #$FFFE
	sta.w $0CAB
	lda.w #$0020
	tsb.w sflags
	asl.b $A5
	asl.b $A5
	ldy.b $A5
	lda.w DATA8_9BAE57,y
	adc.w $0D75
	sta.b $AD
	ldx.w #$0020
	lda.w DATA8_9BAE57,y
	xba
	and.w #$FF00
	sta.w $0EC3,x
	lda.w $AE59,y
	clc
	adc.w $0DD7
	sta.b $B1
	lda.w $AE59,y
	xba
	and.w #$FF00
	sta.w $0EE3,x
	lda.b $AD
	pha
	lda.b $B1
	pha
	stx.b $95
	stz.w $1103,x
	stz.w $1123,x
	lda.w #$0001
	sta.w $0D3B
	sta.w $0D3D
	jsl.l CODE_9E8D3E
	pla
	sta.b $B1
	pla
	sta.b $AD
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
	sta.b $AD
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
	sta.b $B1
CODE_9BAE3E:
	lda.b $AD
	sta.w $0D75
	sta.w $0CEB
	lda.b $B1
	sta.w $0DD7
	sta.w $0D37
	lda.w #$0010
	sta.w $0AF3
	jmp.w CODE_9BABAB
