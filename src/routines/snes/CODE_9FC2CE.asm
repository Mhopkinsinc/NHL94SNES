; Unidentified routine.
CODE_9FC2CE:
	lda.w pfalock,x
	bne CODE_9FC26C
	jsl.l CODE_9EC417
	lda.w position,x
	bne .1
	lda.w $1543,x
	bne CODE_9FC298
.1:
	lda.w sflags
	bit.w #$0004
	bne .t1
	bit.w #$0008
	bne .t2
	lda.w $0BA3
	cmp.b $E4
	beq CODE_9FC371
	lda.b d1
	bit.w #$8000
	bne .t4
	bit.w #$4000
	bne .t3
	lda.w position,x
	beq CODE_9FC32E
	lda.b d1
	bit.w #$0080
	bne CODE_9FC32A
	jml.l CODE_9EA8A9

.t1:
	jml.l passmode

.t2:
	jml.l ShotMode

.t3:
	lda.w #$0014
	sta.b d0
	jml.l assinsert

.t4:
	jml.l CODE_9EE6D2
