; Clear the track pointers and waits of tracks Y up to X
ClearTracks:
	php
	sep #$30
	stx.b $52
	tya
	tax
	asl a
	tay
	rep #$20
	lda.w #$0000
.loop:
	sta.w $086A,y
	sta.w $0848,y
	iny
	iny
	inx
	cpx.b $52
	bne .loop
	plp
	rts
