; Unidentified routine.
CODE_9EB3C5:
	lda.w Pencntdwn
	bpl .t1
	jmp.w .t3

.t1:
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
.loop:
	lda.b [a0]
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq .loop
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
	beq .loop
	cmp.w #$0001
	beq .loop
	lda.w #$0400
	tsb.w sflags
	lda.w brightness
	beq .1
	jsl.l FadeOut
	jsl.l WaitFadeOut
.1:
	jsl.l SetHor
	lda.w #$FF00
	tsb.w puckc
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
	jsl.l PushRef
	jsl.l FadeIn
	jsl.l ScreenOn
	rtl

.t3:
	jsl.l CODE_9EBF11
	lda.w RefCnt
	bmi .t2
	jmp.w CODE_9EB6F6

.t2:
	lda.w RefStep
	bmi .t1x
	jmp.w CODE_9EB6F6

.t1x:
	lda.b d0
	pha
	lda.b $A7
	pha
	stx.b xsave
	ldx.w #$0000
.loopx:
	lda.b a0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne .loopx
	ldx.b xsave
CODE_9EB4A1:
	lda.w #$0000
	sta.b $8B
	lda.w #PenBuf
	sta.b a0
.loop:
	lda.b [a0]
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$0034
	beq .loop
	cmp.w #$0000
	bne InProgress
	jmp.w CODE_9EB6B8
