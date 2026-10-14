; Unidentified routine.
CODE_9DA7A3:
	lda.w #$001C
	jsl.l CODE_9BB385
	sta.l $7E34BE
	sta.w HomeTeam
CODE_9DA7B1:
	lda.w #$001C
	jsl.l CODE_9BB385
	cmp.l $7E34BE
	beq CODE_9DA7B1
	sta.l $7E34C0
	sta.w VisTeam
	lda.w #$0000
	sta.l $7E34CC
	lda.w #$0000
	sta.l $7E34BC
	sta.l $7E34CA
CODE_9DA7D7:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AB610
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$4EF4
	sta.b $10
	jsl.l Decompress
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$47F4
	sta.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.w #$0000
	sta.l $7E3474
	lda.l $7E34BC
	cmp.w #$0002
	beq CODE_9DA81E
	cmp.w #$0003
	bne CODE_9DA822
CODE_9DA81E:
	jsl.l CODE_9D98D3
CODE_9DA822:
	lda.w #$0001
	sta.l $7E34CA
	lda.l $7E34BC
	cmp.w #$0001
	bcc CODE_9DA83E
	cmp.w #$0004
	bcs CODE_9DA83E
	lda.w #$0005
	sta.l $7E34CA
CODE_9DA83E:
	lda.l $7E34CA
	sec
	sbc.w #$0005
	sta.l $7E34CE
	lda.l $7E34BC
	cmp.w #$0001
	bne CODE_9DA857
	jsl.l CODE_9BC7FB
CODE_9DA857:
	lda.w #$0080
	ora.l $7E34F4
	sta.l $7E34F4
	jsl.l CODE_9D9783
	jmp.w CODE_9DA0D5
