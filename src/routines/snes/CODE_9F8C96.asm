; Unidentified routine.
CODE_9F8C96:
	lda.w gsp
	cmp.w #$0003
	bne CODE_9F8CA4
	lda.l $7E34BC
	beq CODE_9F8C43
CODE_9F8CA4:
	jsl.l CODE_9EC791
	lda.w #$0002
	sta.b d0
	jml.l ShootoutWonBy
