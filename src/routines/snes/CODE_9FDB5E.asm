; Unidentified routine.
CODE_9FDB5E:
	lda.w #$0002
	sta.b d1
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FDBBE
	sta.b a0
	lda.w gsp
	cmp.w #$0002
	bne .1
	ldy.b a2
	lda.w tmscore,y
	ldy.b a1
	cmp.w tmscore,y
	beq .1
	php
	lda.w #$009F
	sta.b $8B
	lda.w #$DBC4
	sta.b a0
	plp
	bpl .1
	lda.w #$009F
	sta.b $8B
	lda.w #$DBCA
	sta.b a0
.1:
	lda.b [a0]
	inc.b a0
	inc.b a0
	sta.b d0
	jsl.l CODE_9FDF0C
	lda.b d0
	cmp.w #$0F34
	bcs .2
	dec.b d1
	bpl .1
.2:
	dec.b a0
	dec.b a0
	ldy.b a2
	lda.b [a0]
	sta.w tmline,y
	jmp.w CODE_9FDAA6
