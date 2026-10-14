; Unidentified routine.
CODE_9B9FF0:
	lda.w #$009B
	sta.b $12
	lda.l DATA8_9B9C26,x
	sta.b $10
	lda.w $0C2B,x
	beq CODE_9BA003
org $9BA000
	jmp.w CODE_9BA110
