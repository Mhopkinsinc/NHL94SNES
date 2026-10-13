; Unidentified routine.
DecompressLZ:		; LZ data at [$0C] (after its header) to WRAM
	lda.b $10
	sta.b $6F
	lda.b $12
	sta.b $6D
	stz.b $71
	stz.b $73
	stz.b $75
	stz.b $77
	sep #$20
	ldy.w #$0005
CODE_80B8F0:
	lda.b [$0C],y
	iny
	sta.b $71
	and.b #$80
	beq CODE_80B8FC
	jmp.w CODE_80B957
