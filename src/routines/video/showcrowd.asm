; Draw the crowd sprites
showcrowd:
	lda.w sflags
	and.w #$0800
	beq .t1
	lda.w $0CB9
	bne .t1
	rtl

.t1:
	jsl.l CODE_9BA1A1
	ldx.w #$0022
	lda.w HomeTeam
	cmp.w #$0013
	bne CODE_9B9FDC
	lda.w $0C53
	bne .1
	lda.w $0CC3
	cmp.w #$0002
	bne CODE_9B9FDC
.1:
	ldx.w #$0028
CODE_9B9FDC:
	stx.b $08
	cpx.w #$0000
	beq .1
	cpx.w #$000A
	bne .t2
.1:
	lda.w $0C53
	beq .t2
	jmp.w CODE_9BA076

.t2:
	lda.w #$009B
	sta.b $12
	lda.l DATA8_9B9C26,x
	sta.b $10
	lda.w $0C2B,x
	beq .t1
org $9BA000
	jmp.w CODE_9BA110

.t1:
	cpx.w #$0026
	beq CODE_9BA076
	cpx.w #$0024
	beq CODE_9BA076
	cpx.w #$0022
	beq CODE_9BA04D
	cpx.w #$0020
	beq CODE_9BA079
	cpx.w #$0028
	beq CODE_9BA038
	ldy.w #$0008
	lda.b [$10],y
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	cmp.l crowdlevel
	beq .1x
	bcs CODE_9BA076
.1x:
	jsl.l RandomWord
	and.w #$03F0
	bne CODE_9BA076
CODE_9BA038:
	lda.w #$000A
	sta.w $0C2B,x
	tay
	stz.w $0C55,x
	lda.b [$10],y
	sta.b $0C
	lda.w #$009B
	sta.b $0E
	bra CODE_9BA0A2
CODE_9BA04D:
	lda.w $0DF9
	cmp.w #$001A
	bmi CODE_9BA076
	asl a
	adc.w $0DF9
	clc
	adc.w pucky
	cmp.w #$FEB8
	bpl CODE_9BA076
	cmp.w #$FEB0
	bmi CODE_9BA076
	lda.w $0D71
	cmp.w #$FFF4
	bpl CODE_9BA076
	cmp.w #$FFEC
	bmi CODE_9BA076
	bra CODE_9BA038
