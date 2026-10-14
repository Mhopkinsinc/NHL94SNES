; The computer team picks a line by the man advantage, the score and the line energies
CompLine:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.w #$0003
	sta.b d0
	ldy.b a2
	lda.w tmap,y
	ldy.b a1
	cmp.w tmap,y
	beq CODE_9FDABF
	bpl .1
	inc.b d0
	inc.b d0
.1:
	lda.b d0
	pha
	jsl.l getlinee
	lda.b d0
	sta.b d1
	lda.b $01,s
	inc a
	sta.b d0
	jsl.l getlinee
	lda.b d1
	sec
	sbc.b d0
	bpl .2
	pla
	inc a
	pha
.2:
	pla
	ldy.b a2
	sta.w tmline,y
CODE_9FDAA6:
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	rtl
CODE_9FDABF:
	ldy.b a2
	beq .t2
	jmp.w CODE_9FDB5E

.t2:
	lda.l $7E34C6
	cmp.w #$0002
	bne .t1
	lda.w $19EC,y
	bmi .t1
	jmp.w CODE_9FDB5E

.t1:
	lda.w #$0002
	sta.b d1
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FDB34
	sta.b a0
	lda.w gsp
	cmp.w #$0002
	bne .1
	lda.w $178E,y
	ldy.b a1
	cmp.w $178E,y
	beq .1
	php
	lda.w #$009F
	sta.b $8B
	lda.w #$DB42
	sta.b a0
	plp
	bpl .1
	lda.w #$009F
	sta.b $8B
	lda.w #$DB50
	sta.b a0
.1:
	ldy.b a1
	lda.w tmline,y
	asl a
	sta.b d1
	tay
	lda.b [a0],y
	sta.b d0
	jsl.l getlinee
	lda.b d0
	cmp.w #$0C01
	bcc CODE_9FDB5E
	ldy.b d1
	lda.b [a0],y
	ldy.b a2
	sta.w tmline,y
	jmp.w CODE_9FDAA6
