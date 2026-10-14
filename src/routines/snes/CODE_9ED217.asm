; Unidentified routine.
CODE_9ED217:
	sta.w $1003,x
	lda.w shotPlIdx
	bpl CODE_9ED214
	lda.w puckvy
	ldy.w pfgoal,x
	beq .1
	eor.w #$FFFF
	inc a
.1:
	cmp.w #$F800
	bmi CODE_9ED214
	stz.b a1
	lda.w #$0002
	sta.b a2
	lda.w pfteam,x
	beq .2
	stz.b a2
	lda.w #$0002
	sta.b a1
.2:
	ldy.b a2
	lda.w $17AE,y
	cmp.w #$0096
	bcc CODE_9ED214
CODE_9ED24D:
	jsr.w CODE_9EDC44
	jsl.l vtoa
	jsl.l CODE_9EDC06
	asl.w $12E3,x
	jsl.l .t2
	lsr.w $12E3,x
	rtl

.t2:
	lda.w $1023,x
	sec
	sbc.b d7
	sta.w $1023,x
	bmi .t1
	jmp.w CODE_9ED2F7

.t1:
	adc.w #$0005
	sta.w $1023,x
	lda.w puckvx
	xba
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	clc
	adc.w $0D71
	sta.b d0
	lda.w puckvy
	xba
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:
	clc
	adc.w pucky
	sta.b d1
	jsl.l CODE_9EAB74
	lda.b d1
	pha
	lda.b d0
	pha
	txa
	jsl.l CODE_9BC002
	lda.b d0
	eor.w #$FFFF
	inc a
	sec
	sbc.w $0EC4,x
	and.w #$00FF
	bit.w #$0080
	beq .3
	ora.w #$FF00
.3:
	clc
	adc.b $01,s
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.b d1
	eor.w #$FFFF
	inc a
	sec
	sbc.w $0EE4,x
	and.w #$00FF
	bit.w #$0080
	beq .4
	ora.w #$FF00
.4:
	clc
	adc.b $03,s
	sec
	sbc.w Ypos,x
	sta.b d1
	pla
	pla
	jsl.l vtoa
	lda.b d0
	sta.w $10A3,x
CODE_9ED2F7:
	lda.w $10A3,x
	sta.b d0
	jml.l CODE_9EA8A9
