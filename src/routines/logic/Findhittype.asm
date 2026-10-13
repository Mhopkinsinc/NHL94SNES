; Unidentified routine.
Findhittype:
	lda.b $A5
	eor.w #$FFFF
	inc a
	clc
	adc.w $1163,x
	and.w #$0007
	sta.b $A5
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9EE6BB
	phx
	ldx.b $A5
	lda.l DATA8_9EE6C7,x
	plx
	and.w #$00FF
	rtl
