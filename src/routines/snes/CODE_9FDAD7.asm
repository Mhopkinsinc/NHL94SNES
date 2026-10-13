; Unidentified routine.
CODE_9FDAD7:
	lda.w #$0002
	sta.b $A9
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FDB34
	sta.b $89
	lda.w gsp
	cmp.w #$0002
	bne CODE_9FDB10
	lda.w tmscore,y
	ldy.b $8D
	cmp.w tmscore,y
	beq CODE_9FDB10
	php
	lda.w #$009F
	sta.b $8B
	lda.w #$DB42
	sta.b $89
	plp
	bpl CODE_9FDB10
	lda.w #$009F
	sta.b $8B
	lda.w #$DB50
	sta.b $89
CODE_9FDB10:
	ldy.b $8D
	lda.w tmline,y
	asl a
	sta.b $A9
	tay
	lda.b [$89],y
	sta.b $A5
	jsl.l CODE_9FDF0C
	lda.b $A5
	cmp.w #$0C01
	bcc CODE_9FDB5E
	ldy.b $A9
	lda.b [$89],y
	ldy.b $91
	sta.w tmline,y
	jmp.w $DAA6
