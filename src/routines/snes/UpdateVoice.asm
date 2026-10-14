; Update voice Y: release it when its sound has ended
UpdateVoice:
	rep #$20
	lda.w $091A,x
	bmi .1
	bne .t1
	sep #$20
	lda.w $08F2,y
	cmp.b #$04
	beq .rts
	lda.w $08FA,y
	phx
	tax
	lda.w $08D0,x
	plx
	cmp.b #$00
	bne .rts
	rep #$20
	jsr.w ReleaseVoice
	sep #$20
.rts:
	rts

.t1:
	dec.w $091A,x
.1:
	sep #$20
	rts
