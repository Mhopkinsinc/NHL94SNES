; Unidentified routine.
CODE_9BC989:
	stz.b $A5
	dec.b $A5
	bit.w #$4000
	bne CODE_9BC9C0
	stz.b $A5
	inc.b $A5
	bit.w #$8080
	bne CODE_9BC9C0
	bit.w #$0100
	bne CODE_9BC9F0
	stz.b $A5
	dec.b $A5
	bit.w #$0200
	bne CODE_9BC9F0
	ldy.w #$0006
	sty.b $A5
	bit.w #$0400
	bne CODE_9BC9F0
	ldy.w #$FFFA
	sty.b $A5
	bit.w #$0800
	bne CODE_9BC9F0
	jmp.w $C949
