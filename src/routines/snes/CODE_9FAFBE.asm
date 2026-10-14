; Unidentified routine.
CODE_9FAFBE:
	stz.w $0D71
	stz.w pucky
	stz.w $0DF9
	stz.w puckvx
	stz.w puckvy
	stz.w $0E01
	phx
	ldx.w #$0000
	lda.w #$0002
	sta.b d4
	lda.w $1E91
	beq .1
	ldx.w #$000C
	lda.w #$0000
	sta.b d4
.1:
	lda.w #$0010
	sta.b d0
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
	jsl.l CODE_9FB06C
org $9FB003
	ldx.b d4
	lda.w $19D0,x
	beq CODE_9FB02A
	lda.w $1C90,x
	beq CODE_9FB02A
	ldy.w #$0000
.loop:
	lda.w $19F6,y
	bmi .2
	cmp.b d4
	beq .t1
.2:
	iny
	iny
	cpy.w #$000A
	bcc .loop
	bra CODE_9FB02A

.t1:
	sty.b d4
	jsl.l CODE_9FCD2A
CODE_9FB02A:
	plx
	ldy.w $1E91
	lda.w #$FFFF
	sta.w tmtouch1,y
	sta.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w $19BE
	clc
	adc.w #$0014
	bmi .1
	sta.w $19BE
.1:
	lda.w $1E8D
	sta.w shotPlIdx
	tay
	lda.w $1E93
	bmi .2
	sta.w $19D4,y
.2:
	stz.w $163A
	inc.w $163A
	lda.w #$0001
	sta.w $1E9D
	lda.w #$03E8
	sta.w $1E9F
	jsl.l ClearPenaltyBuffer
	rtl
