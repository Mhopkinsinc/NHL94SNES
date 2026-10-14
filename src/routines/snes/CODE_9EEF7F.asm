; Unidentified routine.
CODE_9EEF7F:
	lda.w $0DF9
	cmp.w #$0008
	bpl .t2
	lda.b d0
	and.w #$000F
	beq .t2
	jmp.w CODE_9EF02A

.t2:
	jsl.l a2touchpuck
	ldy.w $0DF9
	cmp.w #$000E
	bmi .t1
	lda.w #$0005
	jsl.l CODE_9C9A7F
	bra CODE_9EEFAD

.t1:
	lda.w #$0008
	jsl.l CODE_9C9ABC
CODE_9EEFAD:
	stz.w $0E01
	ldy.b a2
	lda.w #$0008
	sta.w $1203,y
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	bne .1
	tya
	jsl.l CODE_9BC002
.1:
	lda.w $0EC3,x
	sta.b d2
	lda.w $0EE3,x
	sta.b d3
	sep #$20
	lda.b d0
	sta.w $0EC4,x
	lda.b d1
	sta.w $0EE4,x
	rep #$30
	jsl.l puckflip
	lda.w $0DF9
	cmp.w #$0008
	bmi CODE_9EF02A
	lda.b d2
	tax
	jsl.l Mul16S
	lda.b $0A
	sta.b $AF
org $9EF000
	lda.b $08
	sta.b d2
	lda.b d3
	tax
	jsl.l Mul16S
	ldx.b a3
	lda.b $08
	clc
	adc.b d2
	sta.b d2
	lda.b $0A
	adc.b $AF
	sta.b $AF
	cmp.w #$0900
	bcc CODE_9EF02B
	lda.w $0DF9
	cmp.w #$000C
	bmi CODE_9EF02A
	jmp.w CODE_9E9B52
