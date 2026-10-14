; Unidentified routine.
CODE_9FC1CE:
	lda.w sfhormode
	beq .1
	lda.b d0
	bit.w #$0008
	bne .1
	inc a
	inc a
	and.w #$0007
	sta.b d0
.1:
	lda.w sflags
	bit.w #$0100
	beq .t2
	jmp.w CODE_9FC26F

.t2:
	lda.w $0B7D,x
	cmp.w #$BCC7
	beq CODE_9FC1CD
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .1x
	ldy.w #$0002
.1x:
	lda.w $1D55,y
	ply
	cmp.w #$0000
	bmi .2
	cmp.b d4
	bne .4
.2:
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .3
	ldy.w #$0002
.3:
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne CODE_9FC273
.4:
	lda.b d1
	bit.w #$2000
	bne CODE_9FC299
	cpx.w shotPlIdx
	bne .t1
	jmp.w CODE_9FC2CE

.t1:
	lda.b d1
	bit.w #$4000
	bne CODE_9FC277
	lda.w pfalock,x
	bne CODE_9FC26C
	lda.b d1
	bit.w #$0040
	bne CODE_9FC2BA
	bit.w #$8000
	bne CODE_9FC27B
	lda.w position,x
	beq CODE_9FC287
	lda.b d1
	bit.w #$0020
	bne CODE_9FC27F
	bit.w #$0010
	bne CODE_9FC283
	lda.w $0D07
	cmp.b $E4
	beq CODE_9FC26C
	lda.b d1
	bit.w #$0080
	bne CODE_9FC2B6
	jml.l doplayeracc
