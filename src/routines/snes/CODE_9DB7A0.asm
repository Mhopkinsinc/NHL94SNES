; Unidentified routine.
CODE_9DB7A0:
	lda.w $0BFB
.loop:
	dec a
	cmp.w #$0100
	bcc .t1
	sta.w $0BFB
	ldx.w #$0064
	jsr.w CODE_9DB884
	bra .loop

.t1:
	lda.w #$0100
	sta.w $0BFB
	rts

.t2:
	lda.w $0BFB
.loopx:
	inc a
	cmp.w #$0200
	bcs .t1x
	sta.w $0BFB
	ldx.w #$0200
	jsr.w CODE_9DB884
	bra .loopx

.t1x:
	lda.w #$0200
	sta.w $0BFB
	rts
