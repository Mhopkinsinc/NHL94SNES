; Unidentified routine.
CODE_9C99CA:
	lda.l $7E35E6
	asl a
	tax
	lda.w #$7000
	sta.b $64
	lda.l DATA8_9C9A73-2,x
	jsl.l CODE_80A17D
	lda.w #$0003
	sta.l $7E35E8
CODE_9C99E4:
	rtl
