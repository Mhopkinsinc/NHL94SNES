; Pause menu Timeout
PauseTimeout:
	lda.b d1
	bit.w #$8080
	beq CODE_9FE42E
	jsl.l CODE_9FC76C
	ldy.b a2
	lda.w $17E2,y
	dec a
	bmi .1
	sta.w $17E2,y
	jsl.l reenergizeteam
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8E9
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9D8000
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8EE
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	ldy.b a2
	lda.w HomeTeam,y
	jsl.l CODE_9BC5AB
	lda.b [a1]
	dec a
	dec a
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0010
	sta.w printx
	jsl.l print
	jsl.l CODE_9DD923
	ldx.w #$0096
	ldy.w #$0000
	jsl.l WaitFrames_Inc
	jsl.l ChoosePauseMenu
.1:
	jmp.w PauseMenuPoll
