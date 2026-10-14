; Unidentified routine.
DATA8_9E8553:
	dw $0000,$003C,$FFBA,$000A
	dw $0000,$003C,$003C,$000A
	dw $0000,$0028,$00AA,$001E
	dw $0000,$0050,$00AA,$0014
	ldy.w $0AD9
	bmi CODE_9E858C
	lda.w pfteam,x
	cmp.w pfteam,y
	bne CODE_9E858C
	lda.w #$0006
	sta.b d0
	jmp.w assreplace
