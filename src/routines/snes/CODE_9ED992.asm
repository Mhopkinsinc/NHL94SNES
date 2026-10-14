; Unidentified routine.
CODE_9ED992:
	lda.w $0B5D,x
	sec
	sbc.w facedir,x
	and.w #$0007
	sta.b d3
	beq CODE_9ED93F
CODE_9ED9A0:
	cmp.w #$0004
	beq CODE_9ED92A
	lsr a
	lsr a
	sta.b d0
	lda.w attribute,x
	bit.w #$0800
	beq .1
	lda.b d0
	eor.w #$0001
	sta.b d0
.1:
	lda.b d3
	cmp.w #$0004
	bcc .2
	eor.w #$FFFF
	adc.w #$0008
.2:
	cmp.w #$0002
	bcs CODE_9ED987
	lda.w $0DF9
	sec
	sbc.w #$0008
	bpl CODE_9EDA04
	lda.w $0E01
	sec
	sbc.w #$0800
	bpl CODE_9EDA04
	lda.b d0
	clc
	adc.w #$0004
	sta.b d0
	ldy.w #$0002
	lda.b [a0],y
	cmp.w #$0009
	bcc CODE_9EDA04
	lda.w facedir,x
	cmp.w #$0002
	beq CODE_9EDA04
	cmp.w #$0006
	beq CODE_9EDA04
	lda.w $0AD9
	bmi CODE_9EDA04
	dec.b d0
	dec.b d0
CODE_9EDA04:
	asl.b d0
	lda.w #$009E
	sta.b $8F
	lda.w #DATA8_9EDBF4
	sta.b a1
	ldy.b d0
	lda.b [a1],y
	sta.w pfalock,x
	jsl.l CODE_9EA3F1
	lda.l $7E35E0
	clc
	adc.w #$0096
	sta.l $7E35E0
	lda.w #$001E
	sta.b $81
CODE_9EDA2C:
	lda.b [a0]
	sta.b d0
	lda.w pucky
	sec
	sbc.w #$00FC
	bpl .1
	lda.w pucky
	sec
	sbc.w #$FF04
	bpl CODE_9EDA51
.1:
	lda.w #$0018
	sta.b d0
	lda.w $0D71
	bpl CODE_9EDA51
	lda.w #$FFE8
	sta.b d0
CODE_9EDA51:
	lda.w $19D4,x
	bmi .t1
	jmp.w CODE_9EDBF3

.t1:
	ldy.w $0AD9
	bmi CODE_9EDAA4
	lda.w pfteam,x
	cmp.w pfteam,y
	beq CODE_9EDAA4
	lda.w SPA,y
	cmp.w #$ED4A
	bcc .t2
	cmp.w #$F021
	bcs .t2
	lda.w $0EE3,y
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	sta.b $00
	lda.w $0EC3,y
	bit.w #$8000
	beq .2
	eor.w #$FFFF
	inc a
.2:
	lsr a
	cmp.b $00
	bcs .t2
	lda.w $0BA1
	bne CODE_9EDAA4
	stz.w $0EC3,x
	stz.w $0EE3,x
	inc.w $0BA1
	rtl

.t2:
	stz.w $0BA1
CODE_9EDAA4:
	lda.b d2
	sta.b d1
	pha
	lda.b d0
	pha
	lda.w $0EC3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:
	eor.w #$FFFF
	inc a
	sta.b d0
	pla
	clc
	adc.b d0
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w $0EE3,x
	xba
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:
	eor.w #$FFFF
	inc a
	sta.b d1
	pla
	clc
	adc.b d1
	sec
	sbc.w Ypos,x
	sta.b d1
	lda.w #$0005
	sta.b tmp0
	cpx.w $0AD9
	bne .3
	asl.b tmp0
.3:
	lda.b d0
	bit.w #$8000
	beq .4
	eor.w #$FFFF
	inc a
.4:
	cmp.b tmp0
	bcs .6
	lda.b d1
	bit.w #$8000
	beq .5
	eor.w #$FFFF
	inc a
.5:
	cmp.b tmp0
	bcs .6
	stz.b d0
	stz.b d1
.6:
	jsl.l vtoa
	lda.b d0
	sta.w $10A3,x
CODE_9EDB21:
	ldy.w $19D4,x
	bpl CODE_9EDB3D
	lda.w $10A3,x
	sta.b d2
	sec
	sbc.w #$0007
	beq .t1
	bmi .t1
	jmp.w CODE_9EA539

.t1:
	jml.l CODE_9EA719
