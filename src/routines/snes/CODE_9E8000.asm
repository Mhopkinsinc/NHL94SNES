; Unidentified routine.
CODE_9E8000:
	lda.w pfalock,x
	bne CODE_9E800C
	lda.w #$F0D2
	jsl.l CODE_9EA3F1
CODE_9E800C:
	rtl
	lda.w pflags,x
	bit.w #$0002
	beq CODE_9E802A
	and.w #$FFFD
	sta.w pflags,x
	stz.w $1043,x
	stz.w $1023,x
	lda.w #$0008
	sta.w $10A3,x
	stz.w $1003,x
CODE_9E802A:
	lda.w position,x
	beq CODE_9E8042
	cpx.w $0AD9
	bne CODE_9E8046
	lda.w #$0011
	sta.b d0
	lda.w $19D4,x
	bpl CODE_9E8041
	jmp.w assinsert
