; Unidentified routine.
CODE_9FDAD7:
	lda.w #$0002
	sta.b d1
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FDB34
	sta.b a0
	lda.w gsp
	cmp.w #$0002
	bne CODE_9FDB10
	lda.w $178E,y
	ldy.b a1
	cmp.w $178E,y
	beq CODE_9FDB10
	php
	lda.w #$009F
	sta.b $8B
	lda.w #$DB42
	sta.b a0
	plp
	bpl CODE_9FDB10
	lda.w #$009F
	sta.b $8B
	lda.w #$DB50
	sta.b a0
CODE_9FDB10:
	ldy.b a1
	lda.w tmline,y
	asl a
	sta.b d1
	tay
	lda.b [a0],y
	sta.b d0
	jsl.l CODE_9FDF0C
	lda.b d0
	cmp.w #$0C01
	bcc CODE_9FDB5E
	ldy.b d1
	lda.b [a0],y
	ldy.b a2
	sta.w tmline,y
	jmp.w CODE_9FDAA6
