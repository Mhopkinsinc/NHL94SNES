; Move the replay one frame forward
adda4:
	stz.b d7
	lda.w sflags
	bit.w #sf2drec
	beq .t2
	lda.b a4+2
	pha
	lda.b a4
	pha
	jsl.l adda43
	lda.b a4+2
	sta.b tmp1
	lda.b a4
	sta.b tmp0
	pla
	sta.b a4
	pla
	sta.b a4+2
	lda.b tmp0
	cmp.w ReplayBufferPtr
	bne .t2
	lda.b tmp1
	cmp.w ReplayBufferPtr+2
	bne .t2
	rtl

.t2:
	lda.b a4
	cmp.w ReplayBufferPtr
	bne .t1
	lda.b $9B
	cmp.w $0D21
	bne .t1
	rtl

.t1:
	jsl.l RestoreReplayFrame
adda43:
	lda.b a4
	clc
	adc.w #$007A
	sta.b a4
	bcc .1
	inc.b $9B
.1:
	cmp.w #$E676
	bne .rtl
	lda.b $9B
	cmp.w #$007E
	bne .rtl
	lda.w #$007E
	sta.b $9B
	lda.w #$577E
	sta.b a4
.rtl:
	rtl
