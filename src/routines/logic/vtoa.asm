; Unidentified routine.
vtoa:
	lda.b $A5
	ora.b $A9
	beq CODE_9BB48D
	stz.b $C3
	lda.b $A5
	bpl CODE_9BB459
	eor.w #$FFFF
	inc a
	sta.b $A5
	inc.b $C3
CODE_9BB459:
	lda.b $A9
	bpl CODE_9BB467
	eor.w #$FFFF
	inc a
	sta.b $A9
	inc.b $C3
	inc.b $C3
CODE_9BB467:
	lda.b $A9
	asl a
	cmp.b $A5
	bcc CODE_9BB473
	lda.w #$0004
	tsb.b $C3
CODE_9BB473:
	lda.b $A5
	asl a
	cmp.b $A9
	bcc CODE_9BB47F
	lda.w #$0008
	tsb.b $C3
CODE_9BB47F:
	phx
	ldx.b $C3
	lda.l DATA8_9BB493,x
	plx
	and.w #$00FF
	sta.b $A5
	rtl
