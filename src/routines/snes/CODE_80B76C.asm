; Unidentified routine.
CODE_80B76C:
	xba
	and.w #$00FF
	asl a
	tax
CODE_80B772:		; free tile cache entry X and its VRAM
	sep #$20
	lda.b #$FF
	sta.w $2741,y
	rep #$20
CODE_80B77B:
	lda.w $2C40,x
	sta.b $00
	dec.w $07BA
	beq CODE_80B7C0
	stx.b $02
	lda.w $07BA
	asl a
	cmp.b $02
	beq CODE_80B7C0
	tay
	lda.w $2540,y
	sta.w $2540,x
	lda.w $2640,y
	sta.w $2640,x
	lda.w $2B40,y
	sta.w $2B40,x
	lda.w $2C40,y
	sta.w $2C40,x
	lda.w $2E40,y
	sta.w $2E40,x
	lda.w $2D40,y
	sta.w $2D40,x
	ldy.w $2B40,x
	txa
	lsr a
	sep #$20
	sta.w $2741,y
	rep #$20
CODE_80B7C0:
	ldx.b $00
	bmi CODE_80B7C7
	jmp.w CODE_80B863
