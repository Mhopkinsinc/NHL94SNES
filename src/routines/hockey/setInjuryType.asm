; Unidentified routine.
setInjuryType:
	ldy.b $91
	lda.w pflags,y
	ora.w #$1000
	sta.w pflags,y
	lda.l $7E35E0
	clc
	adc.w #$012C
	sta.l $7E35E0
	lda.w #$003C
	sta.b $81
	lda.w #$0004
	jsl.l CODE_9C9A7F
	ldy.b $91
	lda.w Xpos,y
	sta.w $0D4B
	lda.w Ypos,y
	sta.w $0D4D
	lda.w #$0040
	tsb.w sflags
	stz.b $A9
	stz.b $89
	lda.w pfteam,y
	beq CODE_9EC31A
	lda.w #$8000
	sta.b $A9
	lda.w #$0002
	sta.b $89
CODE_9EC31A:
	lda.w pnum,y
	and.w #$00FF
	ora.b $A9
	sta.w TempPlOffset
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EC330
	ora.w #$FF00
CODE_9EC330:
	asl a
	sta.b $A9
	lda.b $89
	beq CODE_9EC33A
	lda.w #$0034
CODE_9EC33A:
	adc.b $A9
	tay
	lda.w #$FFFD
	sta.w tmpdst,y
	lda.w #$0007
	jsl.l CODE_9BB385
	cmp.w #$0000
	bne CODE_9EC35E
	lda.w #$FFFC
	sta.w tmpdst,y
	lda.w TempPlOffset
	ora.w #$4000
	sta.w TempPlOffset
CODE_9EC35E:
	rtl
