; Unidentified routine.
a2touchpuck:
	ldy.b a2
	cpy.w #$0018
	bcc .t2
	jmp.w CODE_9EC5A7

.t2:
	lda.w Xpos,y
	sta.l $7E30F8
	lda.w Ypos,y
	sta.l $7E30FA
	tya
	lsr a
	sta.l $7E30F6
	stz.b a0
	lda.w pfteam,y
	beq .1
	inc.b a0
	inc.b a0
.1:
	lda.w pnum,y
	sta.b d0
	ldy.b a0
	cmp.w tmtouch1,y
	beq CODE_9EC565
	lda.w tmflags,y
	bit.w #$0004
	beq .t1
	and.w #$FFFB
	sta.w tmflags,y
	cpy.w #$0000
	bne CODE_9EC555
	lda.w $19BE
	clc
	adc.w #$000A
	bmi .2
	sta.w $19BE
.2:
	bra CODE_9EC555

.t1:
	lda.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w tmtouch1,y
	sta.w tmtouch2,y
CODE_9EC555:
	lda.b d0
	sta.w tmtouch1,y
	cmp.w tmtouch3,y
	bne CODE_9EC565
	lda.w #$FFFF
	sta.w tmtouch3,y
CODE_9EC565:
	lda.w #$1000
	trb.w sflags
	jsl.l a2offsides
	ldy.b a2
	lda.w iflags
	bit.w #$0004
	beq CODE_9EC5AD
	bit.w #$0001
	beq CODE_9EC5AD
	lda.w position,y
	beq CODE_9EC5AD
	lda.w iflags
	bit.w #$0002
	bne CODE_9EC5A8
	lda.w pfgoal,y
	beq CODE_9EC5AD
CODE_9EC590:
	phx
	lda.w $0CF2
	and.w #$00FF
	asl a
	sta.b a3
	tax
	lda.w #$000C
	sta.b d0
	jsl.l AddPenalty
	plx
	stx.b a3
CODE_9EC5A7:
	rtl
