; Unidentified routine.
CODE_9CA227:
	phb
	phk
	plb
	ldx.w #$0000
CODE_9CA22D:
	stz.w Xpos,x
	inx
	inx
	cpx.w #$076E
	bne CODE_9CA22D
	stz.b $BD
	stz.b $8D
	stz.b $91
	stz.b $95
	stz.b $99
	stz.w $0DF9
CODE_9CA244:
	ldx.b $91
	ldy.b $95
	lda.b $BD
	sta.w $1143,y
	lda.w #$FFFF
	sta.w $0E23,y
	sta.w pnum,y
	lda.w DATA8_9CA2FB,x
	sta.w Xpos,y
	lda.w DATA8_9CA2FB+2,x
	sta.w Ypos,y
	lda.w DATA8_9CA2FB+6,x
	sta.w $0D97,y
	lda.w DATA8_9CA2FB+8,x
	sta.w attribute,y
	lda.w DATA8_9CA2FB+10,x
	sta.w $10C3,y
	lda.w DATA8_9CA2FB+12,x
	sta.w $10E3,y
	lda.b $BD
	asl a
	asl a
	asl a
	tay
	lda.w DATA8_9CA2FB+14,x
	sta.w $0F83,y
	ldy.b $95
	sta.w $0B7D,y
	lda.w DATA8_9CA2FB+16,x
	sta.w pflags,y
	lda.w #$0000
	sta.w $1563,y
	cpy.w #$001E
	bne CODE_9CA2A2
	lda.w #$0001
	sta.w $1563,y
CODE_9CA2A2:
	cpx.w #$006C
	rol a
	inc a
	and.w #$0001
	sta.w pfgoal,y
	cpx.w #$006C
	bcc CODE_9CA2BD
	cpx.w #$00D8
	bcs CODE_9CA2BD
	lda.w #$0034
	sta.w pfteam,y
CODE_9CA2BD:
	inc.b $95
	inc.b $95
	sep #$20
	lda.b $BD
	asl a
	ldy.b $8D
	sta.w OOlist,y
	inc.b $8D
	rep #$30
	ldy.b $99
	lda.b $BD
	sta.w OOlistpos,y
	inc.b $99
	inc.b $99
	inc.b $BD
	lda.b $91
	clc
	adc.w #$0012
	sta.b $91
	lda.b $BD
	cmp.w #$0010
	beq CODE_9CA2EE
	jmp.w $A244
