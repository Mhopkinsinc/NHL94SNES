; Unidentified routine.
CODE_80A899:
	cpy.b #$D9
	beq CODE_80A8A1
	cpy.b #$DA
	bne CODE_80A8A8
CODE_80A8A1:
	jsl.l MusicStop
	jmp.w CODE_80ABC2
