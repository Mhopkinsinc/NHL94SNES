; The wanted direction needs no turn
noturn0:
	lda.w #$0002
	sta.b d4
	lda.w $1523,x
	beq .1
	lda.w #$0006
	sta.b d4
	lda.b d0
	eor.w #$0008
	sta.b d0
.1:
	lda.b d0
	beq .t3
	lda.w $0EC3,x
	sta.b d0
	lda.w $0EE3,x
	sta.b d1
	jsl.l vtoa
	bit.w #$0008
	bne .t2
	sec
	sbc.w facedir,x
	clc
	adc.b d4
	and.w #$0007
	sta.b d0
	cmp.w #$0004
	bcs .t2
	jmp.w CODE_9EA4F7

.t2:
	inc.w facedir,x
	lda.w attribute,x
	bit.w #$0800
	beq .1x
	dec.w facedir,x
	dec.w facedir,x
.1x:
	lda.w facedir,x
	and.w #$0007
	sta.w facedir,x
	lda.w #$EA1A
	sta.b d1
	lda.w $1523,x
	bne .t1
	jmp.w SetSPA

.t1:
	ldy.w #$0001
	lda.w #$F0D2
	jml.l SetSPAFromA

.t3:
	ldy.w #$0001
	lda.w #$F104
	sta.b d1
	lda.w $1523,x
	bne .2
	ldy.w #$0000
	lda.w #$EAFE
	sta.b d1
	lda.w pflags,x
	bit.w #$0004
	beq .1x2
	ldy.w #$0001
	lda.w #$F7B2
	sta.b d1
.1x2:
	cpx.w shotPlIdx
	bne .2
	ldy.w #$0000
	lda.w #$EA4C
	sta.b d1
.2:
	lda.w $1543,x
	bne CODE_9EAB64
	tya
	sta.w $1543,x
	jsl.l SetSPA
CODE_9EAB64:
	lda.w $1523,x
	beq .1
	lda.b d2
	eor.w #$0004
	sta.b d2
.1:
	jml.l CODE_9EA719
