; Unidentified routine.
CODE_9C8684:
	lda.w $1DF9
	cmp.w #$0000
	beq CODE_9C86EC
	lda.w $1DB9
	cmp.w $1DBD
	beq CODE_9C86B5
	lda.w #$0001
	sta.w printx
	lda.w $1DB9
	asl a
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9C9363
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9C86B5:
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	cmp.w $1DC1
	beq CODE_9C86E8
CODE_9C86C2:
	lda.w #$0001
	sta.w printx
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	asl a
	sta.w printy
	lda.w #$2000
	sta.w printa
	lda.w #$009C
	sta.b $8F
	lda.w #$9366
	sta.b $8D
	jsl.l CODE_9EC894
CODE_9C86E8:
	jsl.l CODE_9C88A0
CODE_9C86EC:
	jsl.l WaitFrame
	jmp.w $8644
