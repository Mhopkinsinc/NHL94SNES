; Unidentified routine.
CODE_9EB3CD:
	sec
	sbc.b $C1
	sta.w Pencntdwn
	bpl CODE_9EB3C4
	lda.w #$0008
	trb.w gmode
	lda.w #$0000
	sta.b $8B
	lda.w #$15DE
	sta.b $89
CODE_9EB3E5:
	lda.b [$89]
	inc.b $89
	inc.b $89
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB3E5
	tay
	beq CODE_9EB3C4
	dec.b $89
	dec.b $89
	lda.b [$89]
	inc.b $89
	inc.b $89
	and.w #$00FF
	sta.b $A5
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.b [$8D]
	and.w #$00FF
	beq CODE_9EB3E5
	cmp.w #$0001
	beq CODE_9EB3E5
	lda.w #$0400
	tsb.w sflags
	lda.w $0AD3
	beq CODE_9EB434
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
CODE_9EB434:
	jsl.l SetHor
	lda.w #$FF00
	tsb.w puckc
	ldx.w #$001C
	stx.b $95
	lda.w #$001A
	sta.b $A5
	jsl.l assinsert
	ldx.b $95
	lda.w #$1C20
	sta.w temp1,x
	lda.w #$FF00
	tsb.w RefStep
	stz.w RefCnt
	jsl.l UpdatePA
	lda.w #$0032
	sta.w RefCnt
	stz.b $A5
	jsl.l CODE_9EFA36
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	rtl
