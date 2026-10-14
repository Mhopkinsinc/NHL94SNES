; Unidentified routine.
Findhittype:
	lda.b d0
	eor.w #$FFFF
	inc a
	clc
	adc.w facedir,x
	and.w #$0007
	sta.b d0
	lda.w attribute,x
	bit.w #$0800
	beq .t1
	phx
	ldx.b d0
	lda.l DATA8_9EE6C7,x
	plx
	and.w #$00FF
	rtl

.t1:
	phx
	ldx.b d0
	lda.l DATA8_9EE6C7+3,x
	plx
	and.w #$00FF
	rtl
