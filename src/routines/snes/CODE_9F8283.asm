; Unidentified routine.
CODE_9F8283:
	rep #$30
	jsl.l Multi5Init
	jsl.l CODE_9FF436
	jsl.l forceblack
	lda.w #$0000
	tax
.loop:
	sta.l $7F0000,x
	dex
	dex
	bne .loop
	lda.w #$005C
	sta.w $1D59
	jsl.l CODE_9B8000
	jsl.l ResetPassWord
	jsl.l CODE_9D9C97
	jsl.l CODE_9B8526
	lda.w #$0000
	sta.w brightness
	jsl.l CODE_9B8526
	stz.w $1D68
	jsl.l CODE_9DB118
	jsl.l CODE_9C9786
.loop2:
	lda.w brightness
	bne .loop2
	lda.w MusicOn
	bne .loop2
Restart:
	lda.w #$0000
	sta.l playoffRoundIdx
	rep #$30
	lda.w #$1FFF
	tcs
	phk
	plb
	jsl.l CODE_9C978E
	lda.w MusicOn
	beq .1
	lda.w $07ED
	cmp.w #$C20C
	beq .2
	jsl.l CODE_9C9786
.loop:
	lda.w MusicOn
	bne .loop
.1:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
.2:
	stz.w sfhormode
	lda.w #$005C
	sta.w $1D59
	jsl.l CODE_9B8000
	jsl.l CODE_9DA5CA
	stz.w $1D81
	lda.l $7E34BC
	cmp.w #$0004
	bne StartGame
	jsl.l CODE_80C81C
	stz.w $07C6
	jmp.w Restart
