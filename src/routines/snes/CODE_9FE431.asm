; Unidentified routine.
CODE_9FE431:
	lda.b $A9
	bit.w #$8080
	beq CODE_9FE42E
	jsl.l CODE_9FC76C
	ldy.b $91
	lda.w $17E2,y
	dec a
	bmi CODE_9FE4BC
	sta.w $17E2,y
	jsl.l reenergizeteam
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8E9
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
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8EE
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	ldy.b $91
	lda.w HomeTeam,y
	jsl.l CODE_9BC5AB
	lda.b [$8D]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	jsl.l CODE_9EC7BE
	jsl.l CODE_9DD923
	ldx.w #$0096
	ldy.w #$0000
	jsl.l WaitFrames_Inc
	jsl.l CODE_9FE4BF
CODE_9FE4BC:
	jmp.w CODE_9FE19E
