; Unidentified routine.
CODE_9DB754:
	sta.b $00
	asl a
	tax
	lda.w #$007F
	sta.b $12
	lda.w #$5000
	sta.b $10
	lda.l DATA8_9DB78A,x
	tay
	lda.l DATA8_9DB774,x
	tax
	lda.w #$3000
	jsl.l DrawSprite
	rts
