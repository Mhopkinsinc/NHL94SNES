; Move the replay one frame back
suba4:
	lda.b a4
	cmp.w #ReplayBufferStart
	bne .a4ne
	lda.b a4+2
	cmp.w #ReplayBufferStart>>16
	bne .a4ne
	lda.w sflags
	bit.w #sfwrap
	beq .t3
	lda.w #ReplayBufferEnd>>16
	sta.b a4+2
	lda.w #ReplayBufferEnd
	sta.b a4
.a4ne:
	lda.b a4
	sec
	sbc.w #replaysize
	sta.b a4
	lda.b a4+2
	sbc.w #$0000
	sta.b a4+2
	lda.b a4
	cmp.w ReplayBufferPtr
	beq .t2
	jml.l CODE_9BB19D

.t2:
	lda.b $9B
	cmp.w $0D21
	beq .t1
	jml.l CODE_9BB19D

.t1:
	lda.b a4
	clc
	adc.w #$007A
	sta.b a4
	bcc .1
	inc.b $9B
.1:
	cmp.w #$E676
	bne .2
	lda.b $9B
	cmp.w #$007E
	bne .2
	lda.w #$007E
	sta.b $9B
	lda.w #$577E
	sta.b a4
.2:
	stz.b d7
	rtl

.t3:
	jsl.l CODE_9BB19D
	stz.b d7
	rtl
