; Unidentified routine.
CODE_9FBC7B:
	tyx
	lda.l DATA8_9FBD51,x
	sta.b $00
	lda.w $0AE7,y
	asl a
	tax
	lda.w Xpos,x
	sta.b d0
	lda.w Ypos,x
	sta.b d1
	stz.b d2
	jsl.l projxy
	cmp.w #$4E20
	beq CODE_9FBC78
	ldy.w position,x
	bmi CODE_9FBC78
	phx
	tay
	clc
	adc.w #$000A
	sta.b d1
	ldx.b d0
	lda.w #$2000
	jsl.l DrawSprite
	plx
	cpx.w #$0020
	beq CODE_9FBC78
	ldy.w #$0000
	lda.w $13C3,x
	lsr a
	lsr a
	lsr a
	lsr a
	and.w #$000F
	beq .1
	sta.w mesarea+2,y
	iny
	lda.b d0
	sec
	sbc.w #$0004
	sta.b d0
.1:
	lda.w $13C3,x
	and.w #$000F
	sta.w mesarea+2,y
	iny
	lda.b d0
	sec
	sbc.w #$0004
	sta.b d0
	lda.w $1D81
	bne .2
	lda.w position,x
	and.w #$0007
	beq .2
	tax
	lda.w #$FFFF
	sta.w mesarea+2,y
	iny
	lda.l DATA8_9FBD5F-1,x
	sta.w mesarea+2,y
	iny
	lda.b d0
	sec
	sbc.w #$0006
	sta.b d0
.2:
	sty.w mesarea
	ldy.w #$0000
CODE_9FBD10:
	sty.b d2
	lda.w mesarea+2,y
	and.w #$00FF
	cmp.w #$00FF
	beq .t1
	adc.w #$01B0
	sta.b $00
	ldx.b d0
	ldy.b d1
	lda.w #$2000
	jsl.l DrawSprite
	lda.b d0
	clc
	adc.w #$0008
	sta.b d0
	bra CODE_9FBD3F

.t1:
	lda.b d0
	clc
	adc.w #$0004
	sta.b d0
CODE_9FBD3F:
	ldy.b d2
	iny
	cpy.w mesarea
	bne CODE_9FBD10
CODE_9FBD47:
	dec.b a2
	dec.b a2
	bmi .t1
	jmp.w CODE_9FBC6E

.t1:
	rtl
