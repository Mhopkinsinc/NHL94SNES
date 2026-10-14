; Unidentified routine.
CODE_9EC549:
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
