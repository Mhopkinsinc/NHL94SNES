; Unidentified routine.
CODE_9FC76C:
	stz.b a2
	lda.w #$0001
	sta.b $93
	ldx.w $0AC6
	bpl .t1
	txa
	eor.w #$FFFF
	inc a
	sta.b $93
	ldx.w #$0000
.loop:
	lda.w $1C84,x
	cmp.b $93
	beq .t1
	inx
	inx
	cpx.w #$000A
	bcc .loop
	bra CODE_9FC79E

.t1:
	lda.w $1C84,x
	cmp.w #$0001
	beq CODE_9FC79E
	inc.b a2
	inc.b a2
CODE_9FC79E:
	rtl
