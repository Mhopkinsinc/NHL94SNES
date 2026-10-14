; Unidentified routine.
CODE_9EE797:
	lda.w SPA,x
	cmp.w #DATA8_9DEF6E
	beq CODE_9EE7F6
	cmp.w #DATA8_9DF020
	beq CODE_9EE7F6
	phy
	ldy.w #$0000
	cpx.w #$000C
	bmi .1
	ldy.w #$0002
.1:
	lda.w $17D2,y
	inc a
	sta.w $17D2,y
	ply
	lda.w #$0000
	sec
	sbc.w $0BA7
	sta.b d0
	lda.w pfgoal,x
	bne .t1
	lda.w #$FEF8
	sec
	sbc.w $0BA9
	sta.b d1
	bra .2

.t1:
	lda.w #$0108
	sec
	sbc.w $0BA9
	sta.b d1
.2:
	jsl.l vtoa
	jsl.l Findhittype
	beq .t1x
	lda.w #DATA8_9DF020
	bra .3

.t1x:
	lda.w #DATA8_9DEF6E
.3:
	jsl.l SetSPAFromA
	jmp.w CODE_9EE796
