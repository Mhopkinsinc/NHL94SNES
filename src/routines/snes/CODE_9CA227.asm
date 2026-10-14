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
	stz.b d6
	stz.b a1
	stz.b a2
	stz.b a3
	stz.b a4
	stz.w $0DF9
CODE_9CA244:
	ldx.b a2
	ldy.b a3
	lda.b d6
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
	lda.b d6
	asl a
	asl a
	asl a
	tay
	lda.w DATA8_9CA2FB+14,x
	sta.w asslist,y
	ldy.b a3
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
	inc.b a3
	inc.b a3
	sep #$20
	lda.b d6
	asl a
	ldy.b a1
	sta.w OOlist,y
	inc.b a1
	rep #$30
	ldy.b a4
	lda.b d6
	sta.w OOlistpos,y
	inc.b a4
	inc.b a4
	inc.b d6
	lda.b a2
	clc
	adc.w #$0012
	sta.b a2
	lda.b d6
	cmp.w #$0010
	beq CODE_9CA2EE
	jmp.w CODE_9CA244
