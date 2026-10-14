; Unidentified routine.
CODE_9EC6E7:
	jsl.l CODE_9EC64B
	lda.w $1638
	sta.w $1E8B
	beq .rtl
	lda.w $1E9B
	bne .1
	lda.w #$7000
	sta.b $64
	lda.w #$0005
	jsl.l CODE_80A17D
.1:
	lda.w $19BE
	clc
	adc.w #$0014
	bmi .2
	sta.w $19BE
.2:
	phy
	ldy.w #$0000
	lda.w shotPlIdx
	cmp.w #$000C
	bmi .3
	ldy.w #$0002
.3:
	lda.w $1E9B
	bne .4
	lda.w $17C2,y
	inc a
	sta.w $17C2,y
.4:
	ply
.rtl:
	rtl
