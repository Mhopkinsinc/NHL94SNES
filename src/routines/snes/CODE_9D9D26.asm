; Unidentified routine.
CODE_9D9D26:
	jsl.l CODE_9DE0E9
	ldy.b $91
	lda.w tmline,y
	inc a
	sta.b $A5
	sta.w $0D43
	stz.w $0D47
	ldx.b $91
	lda.w HomeTeam,x
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	ldx.w #$004C
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF424
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9F96E6
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0800
	jsl.l CODE_808EDF
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF431
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000F
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF448
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000F
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9D80DD
CODE_9D9DE2:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF44D
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b $A9
	lda.b $91
	beq CODE_9D9E0D
	lda.w VisTeam
	sta.b $A9
	lda.w #$0030
CODE_9D9E0D:
	sta.b $A5
	jsl.l CODE_9FBE08
	jsl.l SpriteFrameEnd
	lda.w #$7F97
	sta.l $7F7502
	lda.w #$FFFF
	sta.l $7F7542
	jsl.l CODE_9DE0D4
	jsl.l CODE_9D9ECB
CODE_9D9E2D:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l CODE_9B852C
	lda.b $A9
	bit.w #$1000
	beq CODE_9D9E4B
	jmp.w $A04C
