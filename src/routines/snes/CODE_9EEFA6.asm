; Unidentified routine.
CODE_9EEFA6:
	lda.w #$0008
	jsl.l CODE_9C9ABC
CODE_9EEFAD:
	stz.w $0E01
	ldy.b $91
	lda.w #$0008
	sta.w $1203,y
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b $A5
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b $A9
	bne CODE_9EEFD1
	tya
	jsl.l CODE_9BC002
CODE_9EEFD1:
	lda.w $0EC3,x
	sta.b $AD
	lda.w $0EE3,x
	sta.b $B1
	sep #$20
	lda.b $A5
	sta.w $0EC4,x
	lda.b $A9
	sta.w $0EE4,x
	rep #$30
	jsl.l CODE_9EDE5E
	lda.w $0DF9
	cmp.w #$0008
	bmi CODE_9EF02A
	lda.b $AD
	tax
	jsl.l Mul16S
	lda.b $0A
	sta.b $AF
org $9EF000
	lda.b $08
	sta.b $AD
	lda.b $B1
	tax
	jsl.l Mul16S
	ldx.b $95
	lda.b $08
	clc
	adc.b $AD
	sta.b $AD
	lda.b $0A
	adc.b $AF
	sta.b $AF
	cmp.w #$0900
	bcc CODE_9EF02B
	lda.w $0DF9
	cmp.w #$000C
	bmi CODE_9EF02A
	jmp.w $9B52
