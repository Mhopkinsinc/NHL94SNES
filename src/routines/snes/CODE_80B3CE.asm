; Unidentified routine.
CODE_80B3CE:
	lda.b $0C
	cmp.w $2540,x
	bne CODE_80B3DC
	lda.b $0E
	cmp.w $2640,x
	beq CODE_80B3C9
CODE_80B3DC:
	inx
	inx
	dey
	bne CODE_80B3CE
CODE_80B3E1:		; allocate VRAM for the frame at [$0C], queue the DMA of its tiles and add a tile cache entry
	ldy.w $07BA
	cpy.w #$0080
	beq CODE_80B44E
	lda.w #$0001
	sta.b $04
	lda.b $0E
	sta.b $07
	ldy.w #$0000
	lda.b [$0C],y
	sta.b $00
	beq CODE_80B3C9
	ldy.w #$000C
	lda.b [$0C],y
	sta.w $07C8
	iny
	iny
	lda.b [$0C],y
	sta.w $07CA
	iny
	iny
	lda.b [$0C],y
	clc
	adc.b $0C
	sta.b $05
	ldy.w #$0002
	ldx.b $00
	bmi CODE_80B41D
	jmp.w CODE_80B661
