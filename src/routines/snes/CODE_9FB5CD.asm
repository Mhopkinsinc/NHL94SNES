; Unidentified routine.
CODE_9FB5CD:
	ldy.w #$0000
.loop:
	lda.w $19F6,y
	cmp.b a2
	beq .t1
	iny
	iny
	cpy.w #$000A
	bcc .loop
	lda.w #$FFFF
	bra CODE_9FB5E4

.t1:
	tya
CODE_9FB5E4:
	rtl
