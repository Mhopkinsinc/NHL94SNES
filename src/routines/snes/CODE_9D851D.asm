; Unidentified routine.
CODE_9D851D:
	dec.w $1DB9
	lda.w #$FFFF
	sta.l $7E3454
	sta.l $7E3452
	stz.b $91
	lda.w $1DB9
	sta.l $7E345A
	lda.w #$0002
	sta.b $91
	lda.w $1DB9
	sta.l $7E345C
	jsl.l CODE_9DDDB3
	lda.w #$3568
	sta.l $7F7500
	jsl.l CODE_9DE0D4
	lda.w #$0002
	sta.b $91
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3B3
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DB9
	jsl.l CODE_9DC973
	lda.b $A5
	sta.w $1D9B
	lda.w #$0001
	sta.b $A9
	jsl.l CODE_9DC561
	lda.b $A5
	pha
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3B8
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1D9B
	sta.b $A5
	jsl.l CODE_9FC427
	jsl.l CODE_9EC7BE
	stz.b $91
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3BD
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1DB9
	jsl.l CODE_9DC973
	lda.b $A5
	sta.w $1D9B
	lda.w #$0001
	sta.b $A9
	jsl.l CODE_9DC561
	lda.b $A5
	pha
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3C2
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $1D9B
	sta.b $A5
	jsl.l CODE_9FC427
	lda.w #$0021
	sec
	sbc.b [$8D]
	sta.w printx
	jsl.l CODE_9EC7BE
	inc.w $1DB9
	jmp.w CODE_9D86AA
