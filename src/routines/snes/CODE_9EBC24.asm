; Unidentified routine.
CODE_9EBC24:
	ldy.b a2
	lda.w pfalock,x
	bne .t1
	lda.w position,x
	beq .t1
	lda.l OptPen
	bne .1
	lda.w $19D4,y
	bmi .1
	lda.w #$0010
	clc
	adc.w $1483,y
	sec
	sbc.w $12E3,x
	jsl.l CODE_9BB385
	cmp.w #$000C
	bcc .t1
.1:
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	jsl.l vtoa
	ldy.b a2
	lda.b d0
	sec
	sbc.w facedir,y
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .t1
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	jsl.l CODE_9E9B52
	jsl.l CODE_9EC042
	beq .t2
	lda.w $1E8D
	bpl .t2
	ldy.b a2
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b d0
	jsl.l AddPenalty
	bra CODE_9EBCB8

.t1:
	rtl

.t2:
	jsl.l checkagr
	lda.b d0
	cmp.w #$0005
	bcs CODE_9EBCB8
	lda.w #$0022
	sta.b d0
	jsl.l AddPenalty
CODE_9EBCB8:
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w #$FFFF
	sta.w $0CDB
	rtl
	lda.w pflags,x
	bit.w #$0002
	bne .t1
	jmp.w CODE_9EBD1D

.t1:
	jsl.l CODE_9EBDF8
	lda.w pflags,x
	and.w #$FFF9
	ora.w #$1000
	sta.w pflags,x
	lda.w #$0000
	sta.b d4
	jsl.l CODE_9BC174
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	jsl.l CODE_9EBEA1
	lda.b $08
	sta.b d1
	sta.w $1063,x
	lda.w #$0088
	sta.w $1043,x
	stz.w $1003,x
	lda.w pflags,x
	ora.w #$8000
	sta.w pflags,x
	stz.w $1103,x
	stz.w $1123,x
	lda.w #$0384
	sta.w $1083,x
CODE_9EBD1D:
	lda.w $1083,x
	sec
	sbc.w $0ADB
	sta.w $1083,x
	bpl CODE_9EBD45
.1:
	jmp.w CODE_9EBDC9
