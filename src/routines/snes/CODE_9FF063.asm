; Unidentified routine.
CODE_9FF063:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF918
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0016
	sta.b $A5
	lda.w #$0007
	sta.b $A9
	jsl.l CODE_9D8000
	ldy.w #$000D
CODE_9FF08E:
	phy
	lda.w #$2400
	sta.w $0D0D
	lda.w #$0006
	sta.w printx
	sty.w printy
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF163
	sta.b $8D
	jsl.l CODE_9EC7BE
	ply
	iny
	cpy.w #$0012
	bcc CODE_9FF08E
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF91D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$2400
	sta.w $0D0D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF179
	sta.b $8D
	lda.w $1D81
	beq CODE_9FF0EC
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF18F
	sta.b $8D
CODE_9FF0EC:
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF922
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$2400
	sta.w $0D0D
	lda.w $1DB9
	bne CODE_9FF11B
	lda.w #$2000
	sta.w $0D0D
CODE_9FF11B:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF1BB
	sta.b $8D
	jsl.l CODE_9EC7BE
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF927
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$2400
	sta.w $0D0D
	lda.w $1DB9
	beq CODE_9FF154
	lda.w #$2000
	sta.w $0D0D
CODE_9FF154:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF1A5
	sta.b $8D
	jsl.l CODE_9EC7BE
	rtl
