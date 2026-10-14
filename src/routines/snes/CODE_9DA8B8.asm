; Unidentified routine.
CODE_9DA8B8:
	lda.b d7
	cmp.w #$0000
	beq CODE_9DA8C9
	cmp.w #$0002
	beq CODE_9DA8C9
	cmp.w #$0004
	bne CODE_9DA8DF
CODE_9DA8C9:
	lda.b d2
	beq CODE_9DA8DF
	lda.w #$0005
	sta.l $7E345E
	lda.w #$0001
	sta.l $7E3456
	sta.l $7E3458
CODE_9DA8DF:
	lda.w #$007E
	sta.b $93
	lda.w #$34BC
	sta.b a2
	lda.w #$009D
	sta.b $97
	lda.w #DATA8_9DACD1
	sta.b a3
	stz.b d5
	ldy.b d7
	lda.b [a3],y
	sta.b d4
	lda.b [a2],y
	sta.b d3
	lda.l $7E34BC
	cmp.w #$0002
	bcc CODE_9DA917
	cmp.w #$0004
	beq CODE_9DA917
	cpy.w #$0002
	bne CODE_9DA917
	lda.w #$001A
	sta.b d4
CODE_9DA917:
	jsr.w CODE_9DA921
	lda.b d3
	sta.b [a2],y
	lda.b d2
CODE_9DA920:
	rts
