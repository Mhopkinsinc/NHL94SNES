; Unidentified routine.
CODE_9D9BFC:
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0008
	sta.b $00
CODE_9D9C06:
	ldy.b $04
	lda.b [$10],y
	ldy.b $14
	beq CODE_9D9C12
CODE_9D9C0E:
	lsr a
	dey
	bne CODE_9D9C0E
CODE_9D9C12:
	ldy.b $02
	and.w $9B8B,y
	ora.l $7E4EF4,x
	sta.l $7E4EF4,x
	inx
	inx
	inc.b $04
	inc.b $04
	dec.b $00
	bne CODE_9D9C06
	rts
