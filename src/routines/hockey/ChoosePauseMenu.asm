; Use the longer pause menu when this side still has a timeout, otherwise the standard menu.
ChoosePauseMenu:
	ldx.w $0AC6
	bmi .t1
	lda.w gmclock
	beq .t1
	lda.w $1A10
	bne .t1
	lda.w $1C84,x
	and.w #$0002
	tay
	lda.w $17E2,y
	beq .t1
	lda.w #$0011
	sta.w $1EB9
	lda.w #$0005
	sta.w $1EB7
	bra CODE_9FE4F4

.t1:
	lda.w #$0010
	sta.w $1EB9
	lda.w #$0000
	sta.w $1EB7
CODE_9FE4F4:
	lda.w $0D13
	clc
	adc.w #$0005
	cmp.w $1EB9
	bcc .rtl
	dec.w $0D13
.rtl:
	rtl
