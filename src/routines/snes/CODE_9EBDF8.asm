; Unidentified routine.
CODE_9EBDF8:
	ldy.b a2
	lda.w $19D0,y
	cmp.w #$0004
	bcc .3
.1:
	sta.b d1
	lda.w #$0006
	sta.b d0
	lda.w tmsort,y
	tax
	ldy.w #$0000
.loop:
	lda.w position,x
	bmi .2
	beq .2
	iny
.2:
	inx
	inx
	dec.b d0
	bne .loop
	cpy.b d1
	beq .4
	bcc .4
.3:
	ldx.b $E4
	lda.w $19D4,x
	bpl .t1
	jmp.w CODE_9EBDF7

.t1:
	sta.b d4
	jsl.l CODE_9FCD0A
	rtl
.4:
	cpy.w #$0003
	bne .2x
	ldx.b a2
	ldy.w $0AF9,x
.loopx:
	iny
	iny
	cpy.w #$000A
	bne .1x
	ldy.w #$0000
.1x:
	lda.w $19F6,y
	bpl .loopx
	and.w #$00FF
	cmp.b a2
	bne .loopx
	sta.w $19F6,y
	inc a
	inc a
	lsr a
	sta.w $1C84,y
.2x:
	ldx.b a2
	ldy.w $0AF9,x
	bra .6
.5:
	iny
	iny
	cpy.w #$000A
	bne .6
	ldy.w #$0000
.6:
	lda.w $19F6,y
	cmp.b a2
	bne .5
	ora.w #$FF00
	sta.w $19F6,y
	lda.w #$0000
	sta.w $1C84,y
	phy
	iny
	iny
	cpy.w #$000A
	bne .1xx
	ldy.w #$0000
.1xx:
	tya
	sta.w $0AF9,x
	ply
	ldx.w $19EC,y
	lda.w #$FFFF
	sta.w $19EC,y
	sta.w $19D4,x
	jmp.w .3
