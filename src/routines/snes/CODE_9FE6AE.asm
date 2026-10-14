; Unidentified routine.
CODE_9FE6AE:
	stx.w $0AC6
	lda.w #$003C
	sta.w $0AC8
	txa
CODE_9FE6B8:
	lsr a
	jsl.l CODE_9B84DC
	dec.w $0AC4
	dec.w $0AC4
	jsl.l ProcessInputWithRepeat
	lda.b d3
	bne .t1
	lda.w $0AC8
	beq CODE_9FE6F2
	sec
	sbc.w #$0003
	sta.w $0AC8
	beq .1
	bpl CODE_9FE6F2
.1:
	stz.w $0AC8
	ldx.w $0AC6
	lda.w $1C84,x
	eor.w #$FFFF
	inc a
	sta.w $0AC6
	rtl

.t1:
	lda.w #$003C
	sta.w $0AC8
CODE_9FE6F2:
	lda.w $0D2F
	beq CODE_9FE712
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	bne CODE_9FE712
	dec.w $0CE3
	bne CODE_9FE712
CODE_9FE70D:
	lda.w #$1000
	tsb.b d3
CODE_9FE712:
	lda.b d1
	ora.b d3
	bne .t1
	jmp.w CODE_9FE618

.t1:
	lda.w $1C84
	ora.w $1C86
	ora.w $1C88
	ora.w $1C8A
	ora.w $1C8C
	beq .rtl
	lda.w #$EA60
	sta.w $0CE3
.rtl:
	rtl
