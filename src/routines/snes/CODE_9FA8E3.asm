; Unidentified routine.
CODE_9FA8E3:
	ldy.w $0CC1
	bne CODE_9FA8FA
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9FA90C
	jsl.l RandomWord
	and.w #$0003
	bne CODE_9FA90C
CODE_9FA8FA:
	lda.w #$0000
	ldy.w $0CC1
	bne CODE_9FA905
CODE_9FA902:
	lda.w #$0002
CODE_9FA905:
	jsl.l CODE_9C9B5F
	stz.w $0CC1
CODE_9FA90C:
	lda.w #$000D
	trb.w sflags
	lda.w #$0001
	trb.w sflags3
	stz.w iflags
	stz.w $0CA9
	lda.w #$FFFF
	sta.w RefCnt
	sta.w $0D19
	sta.w $0D1D
	sta.w $0DF9
	sta.w $0D07
	asl a
	sta.w puckc
	lda.w #$8200
	trb.w sflags
	lda.w #$0000
	sta.l $7E344A
	sta.l $7E344C
	lda.w #$0500
	tsb.w sflags
	jsl.l CODE_9FB9A4
	stz.w Vpos
	stz.w Hpos
	lda.l $7E3136
	sta.w puckx
	lda.l $7E3138
	sta.w pucky
	stz.w puckvx
	stz.w puckvy
	stz.w $0E01
	stz.w $0EDB
	stz.w $0EFB
	stz.w $0D6D
	lda.w #$010C
	sta.w $0DCF
	stz.w $0EDD
	stz.w $0EFD
	stz.w $0D6F
	lda.w #$FEF4
	sta.w $0DD1
	lda.w #$018C
	sta.w $0DB5
	stz.w $11C1
	stz.w $0E21
	stz.w $0E1F
	lda.w #$0040
	trb.w sflags
	lda.w #$0064
	sta.b $B5
CODE_9FA9A4:
	jsl.l CODE_9FC090
	dec.b $B5
	bpl CODE_9FA9A4
	lda.w #$003C
	sta.w $0D4F
	jsl.l ResetBench
	stz.b $91
	jsl.l setpersonel
	jsl.l forcepldata
	inc.b $91
	inc.b $91
	jsl.l setpersonel
	jsl.l forcepldata
	jsl.l CODE_9FD252
	lda.w #$FFFF
	sta.w tmtouch2
	sta.w tmtouch3
	sta.w $17A0
	sta.w $17A4
	lda.b $97
	pha
	lda.b $95
	pha
	stz.b $95
	lda.w #$000B
	sta.b $AD
	lda.b $AD
	pha
CODE_9FA9EF:
	ldx.b $95
	cpx.w #$0018
	bcs CODE_9FAA07
	lda.w pfteam,x
	lsr a
	eor.w gmode
	and.w #$0002
	lsr a
	eor.w #$0001
	sta.w pfgoal,x
CODE_9FAA07:
	lda.w pnum,x
	asl a
	cpx.w #$000C
	bcc CODE_9FAA14
	clc
	adc.w #$0034
CODE_9FAA14:
	tax
	lda.w tmpdst,x
	bmi CODE_9FAA22
	bit.w #$1000
	bne CODE_9FAA22
	jmp.w $ABA2
