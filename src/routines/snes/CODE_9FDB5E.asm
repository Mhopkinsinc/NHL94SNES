; Unidentified routine.
CODE_9FDB5E:
	lda.w #$0002
	sta.b $A9
	lda.w #$009F
	sta.b $8B
	lda.w #DATA8_9FDBBE
	sta.b $89
	lda.w gsp
	cmp.w #$0002
	bne CODE_9FDB99
	ldy.b $91
	lda.w tmscore,y
	ldy.b $8D
	cmp.w tmscore,y
	beq CODE_9FDB99
	php
	lda.w #$009F
	sta.b $8B
	lda.w #$DBC4
	sta.b $89
	plp
	bpl CODE_9FDB99
	lda.w #$009F
	sta.b $8B
	lda.w #$DBCA
	sta.b $89
CODE_9FDB99:
	lda.b [$89]
	inc.b $89
	inc.b $89
	sta.b $A5
	jsl.l CODE_9FDF0C
	lda.b $A5
	cmp.w #$0F34
	bcs CODE_9FDBB0
	dec.b $A9
	bpl CODE_9FDB99
CODE_9FDBB0:
	dec.b $89
	dec.b $89
	ldy.b $91
	lda.b [$89]
	sta.w tmline,y
	jmp.w $DAA6
