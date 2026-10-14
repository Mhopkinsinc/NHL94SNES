; Unidentified routine.
CODE_9D851D:
	dec.w $1DB9
	lda.w #$FFFF
	sta.l $7E3454
	sta.l $7E3452
	stz.b a2
	lda.w $1DB9
	sta.l $7E345A
	lda.w #$0002
	sta.b a2
	lda.w $1DB9
	sta.l $7E345C
	jsl.l CODE_9DDDB3
	lda.w #$3568
	sta.l $7F7500
	jsl.l CODE_9DE0D4
	lda.w #$0002
	sta.b a2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3B3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DB9
	jsl.l CODE_9DC973
	lda.b d0
	sta.w $1D9B
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC561
	lda.b d0
	pha
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3B8
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1D9B
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	stz.b a2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3BD
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DB9
	jsl.l CODE_9DC973
	lda.b d0
	sta.w $1D9B
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC561
	lda.b d0
	pha
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3C2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1D9B
	sta.b d0
	jsl.l CODE_9FC427
	lda.w #$0021
	sec
	sbc.b [a1]
	sta.w printx
	jsl.l print
	inc.w $1DB9
	jmp.w CODE_9D86AA
