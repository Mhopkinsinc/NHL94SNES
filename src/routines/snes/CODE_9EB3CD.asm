; Unidentified routine.
CODE_9EB3CD:
	sec
	sbc.b d7
	sta.w Pencntdwn
	bpl CODE_9EB3C4
	lda.w #$0008
	trb.w gmode
	lda.w #$0000
	sta.b $8B
	lda.w #PenBuf
	sta.b a0
CODE_9EB3E5:
	lda.b [a0]
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq CODE_9EB3E5
	tay
	beq CODE_9EB3C4
	dec.b a0
	dec.b a0
	lda.b [a0]
	inc.b a0
	inc.b a0
	and.w #$00FF
	sta.b d0
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	clc
	adc.b [a1],y
	sta.b a1
	lda.b [a1]
	and.w #$00FF
	beq CODE_9EB3E5
	cmp.w #$0001
	beq CODE_9EB3E5
	lda.w #DMA_OAM
	tsb.w sflags
	lda.w $0AD3
	beq CODE_9EB434
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
CODE_9EB434:
	jsl.l SetHor
	lda.w #$FF00
	tsb.w $0AD9
	ldx.w #$001C
	stx.b a3
	lda.w #$001A
	sta.b d0
	jsl.l assinsert
	ldx.b a3
	lda.w #$1C20
	sta.w $1003,x
	lda.w #$FF00
	tsb.w RefStep
	stz.w RefCnt
	jsl.l UpdatePA
	lda.w #$0032
	sta.w RefCnt
	stz.b d0
	jsl.l CODE_9EFA36
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	rtl
