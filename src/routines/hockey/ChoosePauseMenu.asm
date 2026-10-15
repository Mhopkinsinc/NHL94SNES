; Use the longer pause menu when this side still has a timeout, otherwise the standard menu.
ChoosePauseMenu:
	ldx.w pausepad
	bmi .t1
	lda.w gmclock
	beq .t1
	lda.w InIntermission
	bne .t1
	lda.w $1C84,x
	and.w #$0002
	tay
	lda.w tmtimeouts,y
	beq .t1
	lda.w #$0011
	sta.w $1EB9
	lda.w #$0005
	sta.w $1EB7
	bra .1

.t1:
	lda.w #$0010
	sta.w $1EB9
	lda.w #$0000
	sta.w $1EB7
.1:
	lda.w psfirst
	clc
	adc.w #$0005
	cmp.w $1EB9
	bcc .rtl
	dec.w psfirst
.rtl:
	rtl
