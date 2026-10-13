; Unidentified routine.
CODE_80C277:
	ldy.b #$02
CODE_80C279:
	asl a
	dex
	dex
	beq CODE_80C2A2
CODE_80C27E:
	iny
	bcc CODE_80C279
	sty.b $14
CODE_80C283:
	asl a
	rol.b $6F
	dex
	dex
	beq CODE_80C2AE
CODE_80C28A:
	dey
	bne CODE_80C283
	sta.b $6C
	txy
	lda.b $14
	and.w #$00FF
	asl a
	tax
	lda.l DATA16_80C2BA-4,x
	tyx
	clc
	adc.b $6F
	sta.b $6F
	rts
