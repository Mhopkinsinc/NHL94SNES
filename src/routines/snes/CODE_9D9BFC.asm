; Unidentified routine.
CODE_9D9BFC:
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0008
	sta.b $00
.loop:
	ldy.b $04
	lda.b [$10],y
	ldy.b $14
	beq .1
.loop2:
	lsr a
	dey
	bne .loop2
.1:
	ldy.b $02
	and.w $9B8B,y
	ora.l $7E4EF4,x
	sta.l $7E4EF4,x
	inx
	inx
	inc.b $04
	inc.b $04
	dec.b $00
	bne .loop
	rts
