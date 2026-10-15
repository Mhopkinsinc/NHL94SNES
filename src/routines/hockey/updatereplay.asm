; Save this frame into the replay buffer
updatereplay:
	lda.w gmode
	bit.w #$0010
	bne .1
	lda.w $0CA9
	beq .5
	dec a
	bne .t1
.1:
	jmp.w .6

.t1:
	sta.w $0CA9
.5:
	lda.w sflags
	bit.w #$0400
	bne .2
	lda.w ReplayBufferPtr
	clc
	adc.w #$007A
	sta.w ReplayBufferPtr
	bcc .1x
	inc.w $0D21
.1x:
	cmp.w #$E676
	bne .2
	lda.w $0D21
	cmp.w #$007E
	bne .2
	lda.w #$0010
	tsb.w sflags
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
.2:
	sep #$20
	ldx.w ReplayBufferPtr
	stx.w WMADDL
	lda.w $0D21
	sta.w WMADDH
	lda.b #$0F
	sta.b d2
	ldx.w #$0000
	ldy.w #$0001
.loop:
	lda.w Xpos,x
	sta.w WMDATA
	lda.w $0D56,x
	and.b #$0F
	sta.b $14
	lda.w $0DB8,x
	asl a
	asl a
	asl a
	asl a
	ora.b $14
	sta.w WMDATA
	lda.w Ypos,x
	sta.w WMDATA
	lda.w frame,x
	sta.w WMDATA
	lda.w frame+1,x
	and.b #$3F
	sta.b $14
	lda.w $0E04,x
	and.b #$18
	asl a
	asl a
	asl a
	ora.b $14
	sta.w WMDATA
	inx
	inx
	dec.b d2
	bpl .loop
	lda.b #$05
	sta.b d2
	ldx.w #$0000
.loop2:
	lda.w $13C3,x
	sta.w WMDATA
	lda.w $13C5,x
	sta.w WMDATA
	lda.w position,x
	bpl .3
	lda.b #$FF
.3:
	and.b #$0F
	sta.b $14
	lda.w $0F45,x
	bpl .4
	lda.b #$FF
.4:
	asl a
	asl a
	asl a
	asl a
	ora.b $14
	sta.w WMDATA
	inx
	inx
	inx
	inx
	dec.b d2
	bpl .loop2
	lda.w $0DF9
	sta.w WMDATA
	lda.w $0DFB
	sta.w WMDATA
	lda.w $0CAD
	sta.w WMDATA
	lda.w $0CAF
	sta.w WMDATA
	lda.w $0CB0
	sta.w WMDATA
	lda.w $0CB2
	sta.w WMDATA
	lda.w $0CB3
	sta.w WMDATA
	lda.w $0CB5
	sta.w WMDATA
	lda.w $0CB6
	sta.w WMDATA
	lda.w $0CB8
	sta.w WMDATA
	lda.b d7
	sta.w WMDATA
	lda.w $0AE9
	asl a
	asl a
	asl a
	asl a
	ora.w $0AE7
	sta.w WMDATA
	lda.w $0AED
	asl a
	asl a
	asl a
	asl a
	ora.w $0AEB
	sta.w WMDATA
	lda.w $0AF1
	asl a
	asl a
	asl a
	asl a
	ora.w $0AEF
	sta.w WMDATA
	lda.l crowdlevel
	sta.w WMDATA
	lda.l $7E35E1
	sta.w WMDATA
	lda.w PBnum
	sta.w WMDATA
	lda.w Hpos
	sta.w WMDATA
	lda.w $0CEC
	sta.w WMDATA
	lda.w Vpos
	sta.w WMDATA
	lda.w $0D38
	sta.w WMDATA
	lda.w benchframe
	sta.w WMDATA
	lda.w $0C2A
	sta.w WMDATA
	rep #$20
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
.6:
	rtl
