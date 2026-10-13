; Unidentified routine.
CODE_9EB274:
	dec.b $89
	dec.b $89
	lda.b ($89)
	inc.b $89
	inc.b $89
	and.w #$00FF
	sta.b $A5
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b $8D
	lda.b [$8D],y
	clc
	adc.b $8D
	sta.b $8D
	ldy.w #$0001
	lda.b [$8D],y
	and.w #$00FF
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $A9
	sec
	sbc.w Pencntdwn
	beq CODE_9EB2B1
	bmi CODE_9EB2B1
	lda.b $A9
	sta.w Pencntdwn
CODE_9EB2B1:
	jmp.w $B1F2
